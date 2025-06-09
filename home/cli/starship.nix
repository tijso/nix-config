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
          "$hostname"
          "$username"
          "$directory"
          "$git_branch"
          "$git_status"
          "$fill"
          "$c"
          "$golang"
          "$haskell"
          "$java"
          "$nodejs"
          "$nim"
          "$rust"
          "$scala"
          "$python"
          "$time"
          "$cmd_duration"
          "$shell"
          "$os"
          "$line_break"
          "$character"
          # "[󱞪](fg:iris)"
        ];

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
          success_symbol = "[ •   ](#31748f bold) ";
          error_symbol = "[ •  󰅙 ](#eb6f92 bold) ";
          # success_symbol = "[ •   ](fg:#${config.colorScheme.palette.base0A}) ";
          # error_symbol = "[ •  󰅙 ](fg:#${config.colorScheme.palette.base08})[✘](fg:#${config.colorScheme.palette.base09})[├->](fg:#${config.colorScheme.palette.base0F}) ";
        };

        directory = {
          format = "[](fg:overlay)[ $path ]($style)[](fg:overlay) ";
          # style = "fg:#${config.colorScheme.palette.base07}";
          fish_style_pwd_dir_length = 1;
          style = "bg:overlay fg:pine";
          truncation_length = 3;
          truncation_symbol = "…/";
          substitutions = {
            Documents = "󰈙";
            Downloads = " ";
            Music = " ";
            Pictures = " ";
          };
        };

        fill = {
          style = "fg:overlay";
          symbol = " ";
        };

        cmd_duration = {
          format = " [](fg:overlay)[ $duration 󱑂 ]($style)[](fg:overlay)";
          style = "bg:overlay fg:rose";
        };

        time = {
          disabled = true;
          format = " [](fg:overlay)[ $time 󰴈 ]($style)[](fg:overlay)";
          style = "bg:overlay fg:rose";
          time_format = "%I:%M%P";
          use_12hr = true;
        };

        username = {
          disabled = false;
          format = "[](fg:overlay)[ 󰧱 $user ]($style)[](fg:overlay) ";
          # format = "[$user@]($style)";
          show_always = true;
          style_root = "bg:overlay fg:iris";
          # style_root = "fg:#${config.colorScheme.palette.base03}";
          style_user = "bg:overlay fg:iris";
          # style_user = "fg:#${config.colorScheme.palette.base03}";
        };

        hostname = {
          disabled = false;
          format = "[ $ssh_symbol$hostname ](bold bg:#24273a fg:#E8E3E3)";
        };

        git_branch = {
          format = "[](fg:overlay)[ $symbol $branch ]($style)[](fg:overlay) ";
          # style = "fg:#${config.colorScheme.palette.base0E}";
          style = "bg:overlay fg:foam";
          symbol = "";
        };

        git_status = {
          disabled = false;
          style = "bg:overlay fg:love";
          # style = "fg:#${config.colorScheme.palette.base0E}";
          format = "[](fg:overlay)([$all_status$ahead_behind]($style))[](fg:overlay) ";
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
          format = " [](fg:overlay)[ $symbol$version ]($style)[](fg:overlay)";
          # format = "[$symbol $version]($style)";
          disabled = false;
          symbol = " ";
        };

        c = {
          style = "bg:overlay fg:pine";
          format = " [](fg:overlay)[ $symbol$version ]($style)[](fg:overlay)";
          disabled = false;
          symbol = " ";

        };

        rust = {
          style = "bg:overlay fg:pine";
          # style = "fg:#${config.colorScheme.palette.base0C}";
          format = " [](fg:overlay)[ $symbol$version ]($style)[](fg:overlay)";
          # format = "[$symbol$version]($style)";
          disabled = false;
          symbol = " ";
        };

        python = {
          style = "bg:overlay fg:pine";
          # style = "fg:#${config.colorScheme.palette.base0A}";
          format = " [](fg:overlay)[ $symbol$version ]($style)[](fg:overlay)";
          # format = "[$symbol$version]($style)";
          disabled = false;
          symbol = " ";
        };

        # nix_shell = {
        #   format = "[$symbol$state($name)]($style) ";
        #   style = "fg:#${config.colorScheme.palette.base0D}";
        #   symbol = " ";
        #   impure_msg = "";
        #   pure_msg = "pure ";
        # };

        haskell = {
          style = "bg:overlay fg:pine";
          format = " [](fg:overlay)[ $symbol$version ]($style)[](fg:overlay)";
          disabled = false;
          symbol = " ";
        };

        java = {
          style = "bg:overlay fg:pine";
          format = " [](fg:overlay)[ $symbol$version ]($style)[](fg:overlay)";
          disabled = false;
          symbol = " ";
        };

        scala = {
          style = "bg:overlay fg:pine";
          format = " [](fg:overlay)[ $symbol$version ]($style)[](fg:overlay)";
          disabled = false;
          symbol = " ";
        };

        nodejs = {
          style = "bg:overlay fg:pine";
          format = " [](fg:overlay)[ $symbol$version ]($style)[](fg:overlay)";
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
