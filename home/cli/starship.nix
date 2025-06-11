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
          # "$username"
          # "$directory"
          # "$git_branch"
          # "$git_status"
          # "$fill"
          # "$c"
          # "$golang"
          # "$haskell"
          # "$java"
          # "$nodejs"
          # "$nim"
          # "$rust"
          # "$scala"
          # "$python"
          # "nix_shell"
          # "$time"
          # "$cmd_duration"
          # "$line_break"
          # "$character"

          "[░▒▓](#a3aed2)"
          "[  ](bg:#a3aed2 fg:#090c0c)"
          "[](bg:#769ff0 fg:#a3aed2)"
          "$directory"
          "[](fg:#769ff0 bg:#394260)"
          "$git_branch"
          "$git_status"
          "[](fg:#394260 bg:#212736)"
          "$c"
          "$golang"
          "$haskell"
          "$java"
          "$nodejs"
          "$nim"
          "$rust"
          "$scala"
          "$python"
          "nix_shell"
          "[](fg:#212736 bg:#1d2230)"
          "$time"
          "[ ](fg:#1d2230)"
          "$character"
        ];

        # add_newline = true;

        palette = "rose-pine";

        palettes.rose-pine = {
          overlay = "#26233a";
          love = "#eb6f92";
          gold = "#f6c177";
          rose = "#ebbcba";
          pine = "#31748f";
          foam = "#9ccfd8";
          iris = "#c4a7e7";
        };

        character = {
          success_symbol = "[ •   ](#31748f bold)";
          error_symbol = "[ •  󰅙 ](#eb6f92 bold)";
          # success_symbol = "[ •   ](fg:#${config.colorScheme.palette.base0A}) ";
          # error_symbol = "[ •  󰅙 ](fg:#${config.colorScheme.palette.base08})[✘](fg:#${config.colorScheme.palette.base09})[├->](fg:#${config.colorScheme.palette.base0F}) ";
        };

        directory = {
          format = "[ $path ]($style)";
          # format = "[](fg:overlay)[ $path ]($style)[](fg:overlay) ";
          # style = "fg:#${config.colorScheme.palette.base07}";
          fish_style_pwd_dir_length = 1;
          style = "bg:overlay fg:pine";
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
          style = "fg:overlay";
          symbol = " ";
        };

        cmd_duration = {
          format = "[ $duration 󱑂 ]($style)";
          # format = " [](fg:overlay)[ $duration 󱑂 ]($style)[](fg:overlay)";
          style = "bg:overlay fg:rose";
        };

        time = {
          disabled = true;
          format = "[ $time 󰴈 ]($style)";
          # format = " [](fg:overlay)[ $time 󰴈 ]($style)[](fg:overlay)";
          style = "bg:overlay fg:rose";
          time_format = "%I:%M%P";
          use_12hr = true;
        };

        username = {
          disabled = false;
          show_always = true;
          format = "[ $user ]($style)";
          # format = "[](fg:overlay)[ $user ]($style)[](fg:overlay) ";
          style_root = "bg:overlay fg:iris";
          # style_root = "fg:#${config.colorScheme.palette.base03}";
          style_user = "bg:overlay fg:iris";
          # style_user = "fg:#${config.colorScheme.palette.base03}";
        };

        hostname = {
          disabled = false;
          ssh_only = false;
          format = "[ $ssh_symbol$hostname ]($style)";
          # format = "[](fg:overlay)[ $ssh_symbol$hostname ]($style)[](fg:overlay) ";
          style = "bg:overlay fg:iris";
        };

        os = {
          # os = with config.colorScheme.palette; {
          disabled = false;
          format = "[ $symbol ]($style)";
          # format = "[](fg:overlay)[ $symbol ]($style)[](fg:overlay) ";
          # style = "fg:#${base0D}";
          style = "bg:overlay fg:foam";
          symbols = {
            NixOS = "[ ]($style)";
            # Arch = "[ ]($style)";
            # Linux = "[  ](fg:fg $style)";
          };
        };

        git_branch = {
          format = "[ $symbol $branch ]($style)";
          # format = "[](fg:overlay)[ $symbol $branch ]($style)[](fg:overlay) ";
          # style = "fg:#${config.colorScheme.palette.base0E}";
          style = "bg:overlay fg:foam";
          symbol = "";
        };

        git_status = {
          disabled = false;
          style = "bg:overlay fg:love";
          # style = "fg:#${config.colorScheme.palette.base0E}";
          format = "([$all_status$ahead_behind]($style))";
          # format = "[](fg:overlay)([$all_status$ahead_behind]($style))[](fg:overlay) ";
          up_to_date = "[ ✓ ](bg:overlay fg:iris)";
          untracked = "[?($count)](bg:overlay fg:gold)";
          stashed = "[$](bg:overlay fg:iris)";
          modified = "[!($count)](bg:overlay fg:gold)";
          renamed = "[»($count)](bg:overlay fg:iris)";
          deleted = "[✘($count)](style)";
          staged = "[++($count)](bg:overlay fg:gold)";
          ahead = "[⇡($count)](bg:overlay fg:foam)";
          diverged = "⇕[[](bg:overlay fg:iris)[⇡($ahead_count)](bg:overlay fg:foam)[⇣($behind_count)](bg:overlay fg:rose)[]]";
          behind = "[⇣($count)](bg:overlay fg:rose)";
        };

        # Languages
        golang = {
          style = "bg:overlay fg:pine";
          # style = "fg:#${config.colorScheme.palette.base0C}";
          format = "[ $symbol$version ]($style)";
          # format = " [](fg:overlay)[ $symbol$version ]($style)[](fg:overlay)";
          disabled = false;
          symbol = " ";
        };

        c = {
          style = "bg:overlay fg:pine";
          format = "[ $symbol$version ]($style)";
          # format = " [](fg:overlay)[ $symbol$version ]($style)[](fg:overlay)";
          disabled = false;
          symbol = " ";

        };

        rust = {
          style = "bg:overlay fg:pine";
          # style = "fg:#${config.colorScheme.palette.base0C}";
          format = "[ $symbol$version ]($style)";
          # format = " [](fg:overlay)[ $symbol$version ]($style)[](fg:overlay)";
          disabled = false;
          symbol = " ";
        };

        python = {
          style = "bg:overlay fg:pine";
          # style = "fg:#${config.colorScheme.palette.base0A}";
          format = "[ $symbol$version ]($style)";
          # format = " [](fg:overlay)[ $symbol$version ]($style)[](fg:overlay)";
          disabled = false;
          symbol = " ";
        };

        nix_shell = {
          # style = "fg:#${config.colorScheme.palette.base0D}";
          style = "bg:overlay fg:pine";
          format = "[ $symbol$version ]($style)";
          # format = " [](fg:overlay)[ $symbol$version ]($style)[](fg:overlay)";
          disabled = false;
          symbol = "";

        };

        haskell = {
          style = "bg:overlay fg:pine";
          format = "[ $symbol$version ]($style)";
          # format = " [](fg:overlay)[ $symbol$version ]($style)[](fg:overlay)";
          disabled = false;
          symbol = " ";
        };

        java = {
          style = "bg:overlay fg:pine";
          format = "[ $symbol$version ]($style)";
          disabled = false;
          symbol = " ";
        };

        scala = {
          style = "bg:overlay fg:pine";
          format = "[ $symbol$version ]($style)";
          # format = " [](fg:overlay)[ $symbol$version ]($style)[](fg:overlay)";
          disabled = false;
          symbol = " ";
        };

        nodejs = {
          style = "bg:overlay fg:pine";
          format = "[ $symbol$version ]($style)";
          # format = " [](fg:overlay)[ $symbol$version ]($style)[](fg:overlay)";
          disabled = false;
          symbol = "󰎙 ";
        };

        nim = {
          style = "bg:overlay fg:pine";
          format = " [](fg:overlay)[ $symbol$version ]($style)[](fg:overlay)";
          disabled = false;
          symbol = "󰆥 ";
        };
      };
    };
  };
}
