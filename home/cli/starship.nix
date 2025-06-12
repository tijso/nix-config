{
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.modules.cli.starship;
in
{
  options.modules.cli.starship.enable = mkEnableOption "Enable Starship";
  config = mkIf cfg.enable {
    programs.starship = {
      enable = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
      settings = {
        format = lib.concatStrings [
          # "$os"
          "$hostname"
          "$directory"
          "$git_branch"
          "$git_status"
          "$fill"
          "$c"
          "$lua"
          "$golang"
          "$haskell"
          "$java"
          "$nodejs"
          "$nim"
          "$rust"
          "$scala"
          "$python"
          "$nix_shell"
          "$jobs"
          "$cmd_duration"
          "$line_break"
          "$character"
        ];

        palette = "rose-pine";

        palettes.rose-pine = {
          base = "#191724"; # Base background
          surface = "#1f1d2e"; # Surface background
          overlay = "#26233a"; # Overlay background
          muted = "#6e6a86"; # Muted text
          subtle = "#908caa"; # Subtle text
          text = "#e0def4"; # Main text
          love = "#eb6f92"; # Love (red/pink)
          gold = "#f6c177"; # Gold (yellow/orange)
          rose = "#ebbcba"; # Rose (light pink)
          pine = "#31748f"; # Pine (teal/cyan)
          foam = "#9ccfd8"; # Foam (light cyan)
          iris = "#c4a7e7"; # Iris (purple)
          highlight_low = "#21202e";
          highlight_med = "#403d52";
          highlight_high = "#524f67";
        };

        character = {
          # success_symbol = "[ •   ](#31748f bold)";
          # error_symbol = "[ •  󰅙 ](#eb6f92 bold)";
          success_symbol = "[ •   ](fg:#${config.colorScheme.palette.base0B}) ";
          error_symbol = "[ •  󰅙 ](fg:#${config.colorScheme.palette.base08})[✘](fg:#${config.colorScheme.palette.base09})[├->](fg:#${config.colorScheme.palette.base0F}) ";
        };

        directory = {
          format = "[ $path ]($style)";
          fish_style_pwd_dir_length = 1;
          style = "fg:#${config.colorScheme.palette.base0B}";
          truncation_length = 3;
          truncation_symbol = "…/";
        };

        directory.substitutions = {
          Documents = "󰈙";
          Downloads = " ";
          Music = " ";
          Pictures = " ";
        };

        fill = {
          symbol = " ";
        };

        cmd_duration = {
          format = "[ $duration 󱑂 ]($style)";
          # style = "fg:rose";
          style = "fg:#${config.colorScheme.palette.base0A}";
        };

        jobs = {
          symbol = " ";
          style = "fg:love";
          # style = "fg:#${config.colorScheme.palette.base0E}";
          number_threshold = 1;
          format = "[$symbol]($style)";
        };

        hostname = {
          disabled = false;
          ssh_only = false;
          format = "[ $ssh_symbol$hostname ]($style)";
          style = "fg:rose";
          # style = "fg:#${config.colorScheme.palette.base0E}";
        };

        os = {
          disabled = false;
          format = "[ $symbol ]($style)";
          style = "fg:rose";
          # style = "fg:#${config.colorScheme.palette.base0E}";
          symbols = {
            NixOS = "[ ]($style)";
            # Arch = "[ ]($style)";
          };
        };

        git_branch = {
          symbol = " ";
          format = "[on](fg:subtle) [$symbol$branch ]($style)";
          style = "fg:foam";
          # style = "fg:#${config.colorScheme.palette.base0E}";
        };

        git_status = {
          disabled = false;
          style = "fg:foam";
          # style = "fg:#${config.colorScheme.palette.base0E}";
          format = "([$all_status$ahead_behind]($style))";
          up_to_date = "[ ✓ ](fg:foam)";
          untracked = "[?($count)](fg:gold)";
          stashed = "[$](fg:iris)";
          modified = "[!($count)](fg:gold)";
          renamed = "[»($count)](fg:iris)";
          deleted = "[✘($count)](fg:love)";
          staged = "[++($count)](fg:foam)";
          ahead = "[⇡($count)](fg:foam)";
          diverged = "⇕[[](fg:iris)[⇡($ahead_count)](fg:foam)[⇣($behind_count)](fg:love)[]]";
          behind = "[⇣($count)](fg:love)";
        };

        golang = {
          symbol = " ";
          style = "fg:pine";
          # style = "fg:#${config.colorScheme.palette.base0E}";
          format = "[ $symbol$version ]($style)";
          disabled = false;
        };

        lua = {
          symbol = "  ";
          style = "fg:pine";
          # style = "fg:#${config.colorScheme.palette.base0E}";
          format = "[ $symbol$version ]($style)";
          disabled = false;
        };

        c = {
          symbol = " ";
          style = "fg:pine";
          # style = "fg:#${config.colorScheme.palette.base0E}";
          format = "[ $symbol$version ]($style)";
          disabled = false;
        };

        rust = {
          symbol = " ";
          style = "fg:pine";
          # style = "fg:#${config.colorScheme.palette.base0E}";
          format = "[ $symbol$version ]($style)";
          disabled = false;
        };

        python = {
          symbol = " ";
          style = "fg:gold";
          # style = "fg:#${config.colorScheme.palette.base0E}";
          format = "[ $symbol$version ]($style)";
          disabled = false;
        };

        nix_shell = {
          symbol = " ";
          style = "fg:foam";
          # style = "fg:#${config.colorScheme.palette.base0E}";
          format = "[ $symbol$version ]($style)";
          disabled = false;
        };

        haskell = {
          symbol = " ";
          style = "fg:iris";
          # style = "fg:#${config.colorScheme.palette.base0E}";
          format = "[ $symbol$version ]($style)";
          disabled = false;
        };

        java = {
          symbol = " ";
          style = "fg:love";
          # style = "fg:#${config.colorScheme.palette.base0E}";
          format = "[ $symbol$version ]($style)";
          disabled = false;
        };

        scala = {
          symbol = " ";
          style = "fg:love";
          # style = "fg:#${config.colorScheme.palette.base0E}";
          format = "[ $symbol$version ]($style)";
          disabled = false;
        };

        nodejs = {
          symbol = "󰎙 ";
          style = "fg:foam";
          # style = "fg:#${config.colorScheme.palette.base0E}";
          format = "[ $symbol$version ]($style)";
          disabled = false;
        };

        nim = {
          symbol = "󰆥 ";
          style = "fg:gold";
          # style = "fg:#${config.colorScheme.palette.base0E}";
          format = "[ $symbol$version ]($style)";
          disabled = false;
        };
      };
    };
  };
}
