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
          "[](#ebbcba)"
          "$os"
          # "[](bg:#c4a7e7 fg:#ebbcba)"
          "$directory"
          # "[](fg:#191724 bg:#26233a)"
          "$git_branch"
          "$git_status"
          # "[](fg:#26233a bg:#191724)"
          "$c"
          "$golang"
          "$haskell"
          "$java"
          "$nodejs"
          "$nim"
          "$rust"
          "$scala"
          "$python"
          "$nix_shell"
          # "[](fg:#191724 bg:#1f1d2e)"
          "$cmd_duration"
          # "[ ](fg:#26233a)"
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
          success_symbol = "[ •   ](#31748f bold)";
          error_symbol = "[ •  󰅙 ](#eb6f92 bold)";
          # success_symbol = "[ •   ](fg:#${config.colorScheme.palette.base0A}) ";
          # error_symbol = "[ •  󰅙 ](fg:#${config.colorScheme.palette.base08})[✘](fg:#${config.colorScheme.palette.base09})[├->](fg:#${config.colorScheme.palette.base0F}) ";
        };

        directory = {
          format = "[ $path ]($style)";
          fish_style_pwd_dir_length = 1;
          style = "fg:iris";
          # style = "bg:overlay fg:iris";
          # style = "fg:#${config.colorScheme.palette.base07}";
          truncation_length = 3;
          truncation_symbol = "…/";
        };

        directory.substitutions = {
          Documents = "󰈙";
          Downloads = " ";
          Music = " ";
          Pictures = " ";
        };

        cmd_duration = {
          format = "[ $duration 󱑂 ]($style)";
          style = "fg:rose";
          # style = "bg:overlay fg:rose";
        };

        time = {
          disabled = true;
          format = "[ $time 󰴈 ]($style)";
          style = "bg:surface fg:text";
          time_format = "%I:%M%P";
          use_12hr = true;
        };

        username = {
          disabled = false;
          show_always = true;
          format = "[ $user ]($style)";
          style_root = "bg:overlay fg:love";
          # style_root = "fg:#${config.colorScheme.palette.base03}";
          style_user = "bg:overlay fg:iris";
          # style_user = "fg:#${config.colorScheme.palette.base03}";
        };

        hostname = {
          disabled = false;
          ssh_only = false;
          format = "[ $ssh_symbol$hostname ]($style)";
          style = "bg:overlay fg:foam";
        };

        os = {
          disabled = false;
          format = "[ $symbol ]($style)";
          style = "bg:pine fg:base";
          # style = "fg:#${base0D}";
          symbols = {
            NixOS = "[ ]($style)";
            # Arch = "[ ]($style)";
          };
        };

        git_branch = {
          format = "[ $symbol $branch ]($style)";
          style = "fg:foam";
          # style = "bg:overlay fg:foam";
          # style = "fg:#${config.colorScheme.palette.base0E}";
          symbol = " ";
        };

        git_status = {
          disabled = false;
          style = "fg:love";
          # style = "bg:overlay fg:love";
          # style = "fg:#${config.colorScheme.palette.base0E}";
          format = "([$all_status$ahead_behind]($style))";
          up_to_date = "[ ✓ ](fg:foam)";
          # up_to_date = "[ ✓ ](bg:overlay fg:foam)";
          untracked = "[?($count)](fg:gold)";
          # untracked = "[?($count)](bg:overlay fg:gold)";
          stashed = "[$](fg:iris)";
          # stashed = "[$](bg:overlay fg:iris)";
          modified = "[!($count)](fg:gold)";
          # modified = "[!($count)](bg:overlay fg:gold)";
          renamed = "[»($count)](fg:iris)";
          # renamed = "[»($count)](bg:overlay fg:iris)";
          deleted = "[✘($count)](fg:love)";
          # deleted = "[✘($count)](bg:overlay fg:love)";
          staged = "[++($count)](fg:foam)";
          # staged = "[++($count)](bg:overlay fg:foam)";
          ahead = "[⇡($count)](fg:foam)";
          # ahead = "[⇡($count)](bg:overlay fg:foam)";
          diverged = "⇕[[](fg:iris)[⇡($ahead_count)](fg:foam)[⇣($behind_count)](fg:love)[]]";
          # diverged = "⇕[[](bg:overlay fg:iris)[⇡($ahead_count)](bg:overlay fg:foam)[⇣($behind_count)](bg:overlay fg:love)[]]";
          behind = "[⇣($count)](fg:love)";
          # behind = "[⇣($count)](bg:overlay fg:love)";
        };

        # Languages
        golang = {
          style = "fg:pine";
          # style = "bg:base fg:pine";
          format = "[ $symbol$version ]($style)";
          disabled = false;
          symbol = " ";
        };

        c = {
          style = "fg:pine";
          # style = "bg:base fg:pine";
          format = "[ $symbol$version ]($style)";
          disabled = false;
          symbol = " ";
        };

        rust = {
          style = "fg:pine";
          # style = "bg:base fg:pine";
          format = "[ $symbol$version ]($style)";
          disabled = false;
          symbol = " ";
        };

        python = {
          style = "fg:gold";
          # style = "bg:base fg:gold";
          format = "[ $symbol$version ]($style)";
          disabled = false;
          symbol = " ";
        };

        nix_shell = {
          style = "fg:foam";
          # style = "bg:base fg:foam";
          format = "[ $symbol$version ]($style)";
          disabled = false;
          symbol = " ";
        };

        haskell = {
          style = "fg:iris";
          # style = "bg:base fg:iris";
          format = "[ $symbol$version ]($style)";
          disabled = false;
          symbol = " ";
        };

        java = {
          style = "fg:love";
          # style = "bg:base fg:love";
          format = "[ $symbol$version ]($style)";
          disabled = false;
          symbol = " ";
        };

        scala = {
          style = "fg:love";
          # style = "bg:base fg:love";
          format = "[ $symbol$version ]($style)";
          disabled = false;
          symbol = " ";
        };

        nodejs = {
          style = "fg:foam";
          # style = "bg:base fg:foam";
          format = "[ $symbol$version ]($style)";
          disabled = false;
          symbol = "󰎙 ";
        };

        nim = {
          style = "fg:gold";
          # style = "bg:base fg:gold";
          format = "[ $symbol$version ]($style)";
          disabled = false;
          symbol = "󰆥 ";
        };
      };
    };
  };
}
