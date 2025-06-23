{ lib, config, ... }:
with lib;
{
  options.myHome.cli.nushell = {
    enable = mkEnableOption "Enable Nushell";
  };

  config = mkIf config.myHome.cli.nushell.enable {
    programs.nushell = {
      enable = true;

      # Only keep aliases for external tools that don't have Nushell equivalents
      shellAliases = {
        # These are fine - they're external programs
        vi = "nvim";
        vim = "nvim";
        lg = "lazygit";
        img = "wezterm imgcat";

        # External better tools (but consider Nushell alternatives)
        bat = "bat --paging=never"; # Keep for syntax highlighting
        rg = "rg"; # Keep for regex search
        fd = "fd"; # Keep for complex file finding
      };

      configFile.text = ''
        # Hide banner and set vi mode
        $env.config = ($env.config | upsert show_banner false)
        $env.config = ($env.config | upsert edit_mode vi)

        # Navigation - Nushell way
        def ".." [] { cd .. }
        def "..." [] { cd ../.. }

        # File listing - USE NUSHELL'S BUILT-IN LS!
        # Don't alias ls to eza - use Nushell's ls which gives you structured data
        def la [] { ls -a | sort-by type name }
        def ll [] { ls -l | sort-by type name }
        def lt [depth: int = 2] { 
          # Use Nushell's recursive approach
          glob **/* | where ($it | path type) == dir | first $depth
        }

        # File operations - Nushell way
        def preview [file: path] {
          let info = (ls $file | first)
          print $"File: ($info.name)"
          print $"Size: ($info.size)"
          print $"Modified: ($info.modified)"
          
          # Use Nushell's built-in file reading
          if ($info.size < 1MB) {
            if ($file | str ends-with .json) {
              open $file | to json --indent 2
            } else if ($file | str ends-with .csv) {
              open $file | first 10
            } else if ($file | str ends-with .yaml) or ($file | str ends-with .yml) {
              open $file
            } else {
              open $file | first 20 | each { |line| print $line }
            }
          } else {
            print "File too large for preview"
          }
        }

        # Search - Nushell way with structured data
        def search [term: string] {
          ^nix search nixpkgs $term | lines | where ($it | str contains $term)
        }

        # Process management - Nushell way
        def psg [pattern: string] {
          ps | where name =~ $pattern | select pid name cpu mem
        }

        # System info - using Nushell's sys command
        def sysinfo [] {
          let host = (sys host)
          let mem = (sys mem)
          let cpu = (sys cpu | length)
          
          print $"🖥️  System: ($host.name)"
          print $"💾 Memory: ($mem.total | into filesize) total"
          print $"🧠 CPU: ($cpu) cores" 
          print $"⏰ Uptime: ($host.uptime)"
        }

        # Project navigation with Nushell path handling
        def config [] { 
          cd ~/nix-config
          ls | where type == dir | get name  # Show only directories
        }

        def personal [] { 
          cd ~/projects/personal
          ls | where type == dir | select name size modified
        }

        def github [] { 
          cd ~/projects/personal/github
          # Show git repos with status
          ls | where type == dir | each { |dir|
            cd $dir.name
            let status = (do -i { git status --porcelain | lines | length })
            cd ..
            { name: $dir.name, changes: $status }
          }
        }

        # Git operations - leveraging Nushell's structured data
        def gst [] {
          ^git status --porcelain 
          | lines 
          | parse "{status} {file}"
          | upsert status { |row|
            match $row.status {
              " M" => "Modified",
              "??" => "Untracked", 
              " A" => "Added",
              " D" => "Deleted",
              _ => $row.status
            }
          }
        }

        def glog [count: int = 10] {
          ^git log --oneline -n $count
          | lines
          | parse "{hash} {message}"
          | upsert hash { |row| $row.hash | str substring 0..7 }
        }

        # Nix operations with better feedback
        def rebuild [] {
          print "🏗️ Starting system rebuild..."
          let result = (do { ^sudo nixos-rebuild switch --flake ~/nix-config#serenity } | complete)
          if $result.exit_code == 0 {
            print "✅ System rebuild successful!"
          } else {
            print "❌ System rebuild failed!"
            print $result.stderr
          }
        }

        def rebuild-home [] {
          print "🏠 Rebuilding home configuration..."
          let result = (do { ^home-manager switch --flake ~/nix-config#tijso@serenity } | complete)
          if $result.exit_code == 0 {
            print "✅ Home rebuild successful!"
          } else {
            print "❌ Home rebuild failed!"
            print $result.stderr
          }
        }

        def update [] {
          cd ~/nix-config
          print "📦 Updating flake inputs..."
          ^nix flake update
          
          # Show what changed using Nushell
          ^git diff --name-only | lines | each { |file|
            print $"📄 Updated: ($file)"
          }
        }

        def clean [] {
          print "🧹 Analyzing store before cleanup..."
          let before = (^du -sh /nix/store | parse "{size} {path}" | get size | first)
          
          ^sudo nix-collect-garbage -d
          ^nix store optimise
          
          let after = (^du -sh /nix/store | parse "{size} {path}" | get size | first)
          print $"✨ Cleanup complete! Went from ($before) to ($after)"
        }

        # File content search - Nushell way
        def find-content [pattern: string, path: string = "."] {
          glob $"($path)/**/*" 
          | where ($it | path type) == file
          | each { |file|
            try {
              let content = (open $file | lines)
              let matches = ($content | where ($it | str contains $pattern) | length)
              if $matches > 0 {
                { file: $file, matches: $matches }
              }
            } catch {
              null
            }
          }
          | where ($it != null)
          | sort-by matches --reverse
        }

        # Network info using Nushell
        def ports [] {
          # This would need netstat/ss output parsed, but shows the concept
          ^ss -tulpn | lines | skip 1 | each { |line|
            $line | parse "{proto} {recv} {send} {local} {foreign} {state} {process}"
          }
        }
      '';
    };
  };
}
