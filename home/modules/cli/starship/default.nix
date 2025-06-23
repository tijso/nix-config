{
  config,
  lib,
  ...
}:
with lib;
{
  options.myHome.cli.starship.enable = mkEnableOption "Enable Starship";
  config = mkIf config.myHome.cli.starship.enable {
    programs.starship = {
      enable = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
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

        character = {
          success_symbol = "[ •   ](fg:#${config.lib.stylix.colors.base0B})";
          error_symbol = "[ •  󰅙 ](fg:#${config.lib.stylix.colors.base08})";
        };

        directory = {
          format = "[ $path ]($style)";
          fish_style_pwd_dir_length = 1;
          style = "fg:#${config.lib.stylix.colors.base0B}";
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
          style = "fg:#${config.lib.stylix.colors.base0A}";
        };

        jobs = {
          symbol = " ";
          style = "fg:#${config.lib.stylix.colors.base08}";
          number_threshold = 1;
          format = "[$symbol]($style)";
        };

        hostname = {
          disabled = false;
          ssh_only = false;
          format = "[ $ssh_symbol$hostname ]($style)";
          style = "fg:#${config.lib.stylix.colors.base0A}";
        };

        os = {
          disabled = false;
          format = "[ $symbol ]($style)";
          style = "fg:#${config.lib.stylix.colors.base0A}";
          symbols = {
            NixOS = "[ ]($style)";
            # Arch = "[ ]($style)";
          };
        };

        git_branch = {
          symbol = " ";
          format = "[on](fg:#${config.lib.stylix.colors.base04}) [$symbol$branch ]($style)";
          style = "fg:#${config.lib.stylix.colors.base0C}";
        };

        git_status = {
          disabled = false;
          style = "fg:#${config.lib.stylix.colors.base0C}";
          format = "([$all_status$ahead_behind]($style))";
          up_to_date = "[ ✓ ](fg:#${config.lib.stylix.colors.base0C})";
          untracked = "[?($count)](fg:#${config.lib.stylix.colors.base09})";
          stashed = "[$](fg:#${config.lib.stylix.colors.base0D})";
          modified = "[!($count)](fg:#${config.lib.stylix.colors.base09})";
          renamed = "[»($count)](fg:#${config.lib.stylix.colors.base0D})";
          deleted = "[✘($count)](fg:#${config.lib.stylix.colors.base08})";
          staged = "[++($count)](fg:#${config.lib.stylix.colors.base0C})";
          ahead = "[⇡($count)](fg:#${config.lib.stylix.colors.base0C})";
          diverged = "⇕[[](fg:iris)[⇡($ahead_count)](fg:foam)[⇣($behind_count)](fg:#${config.lib.stylix.colors.base08})[]]";
          behind = "[⇣($count)](fg:#${config.lib.stylix.colors.base08})";
        };

        golang = {
          symbol = " ";
          style = "fg:#${config.lib.stylix.colors.base0B}";
          format = "[ $symbol$version ]($style)";
          disabled = false;
        };

        lua = {
          symbol = "  ";
          style = "fg:#${config.lib.stylix.colors.base0B}";
          format = "[ $symbol$version ]($style)";
          disabled = false;
        };

        c = {
          symbol = " ";
          style = "fg:#${config.lib.stylix.colors.base0B}";
          format = "[ $symbol$version ]($style)";
          disabled = false;
        };

        rust = {
          symbol = " ";
          style = "fg:#${config.lib.stylix.colors.base08}";
          format = "[ $symbol$version ]($style)";
          disabled = false;
        };

        python = {
          symbol = " ";
          style = "fg:#${config.lib.stylix.colors.base09}";
          format = "[ $symbol$version ]($style)";
          disabled = false;
        };

        nix_shell = {
          symbol = " ";
          style = "fg:#${config.lib.stylix.colors.base0B}";
          format = "[ $symbol$version ]($style)";
          disabled = false;
        };

        haskell = {
          symbol = " ";
          style = "fg:#${config.lib.stylix.colors.base0D}";
          format = "[ $symbol$version ]($style)";
          disabled = false;
        };

        java = {
          symbol = " ";
          style = "fg:#${config.lib.stylix.colors.base0A}";
          format = "[ $symbol$version ]($style)";
          disabled = false;
        };

        scala = {
          symbol = " ";
          style = "fg:#${config.lib.stylix.colors.base0A}";
          format = "[ $symbol$version ]($style)";
          disabled = false;
        };

        nodejs = {
          symbol = "󰎙 ";
          style = "fg:#${config.lib.stylix.colors.base0A}";
          format = "[ $symbol$version ]($style)";
          disabled = false;
        };

        nim = {
          symbol = "󰆥 ";
          style = "fg:#${config.lib.stylix.colors.base0E}";
          format = "[ $symbol$version ]($style)";
          disabled = false;
        };
      };
    };
  };
}
