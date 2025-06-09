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

          "$username"
          "$directory"
          "$git_branch"
          "$git_status"
          "$fill"
          "$c"
          "$elixir"
          "$elm"
          "$golang"
          "$haskell"
          "$java"
          "$julia"
          "$nodejs"
          "$nim"
          "$rust"
          "$scala"
          "$conda"
          "$python"
          "$time"
          "$line_break"
          "$character"
          # "[󱞪](fg:iris)"
        ];
        # format = ''
        #   [┌](fg:#${config.colorScheme.palette.base0A}) $hostname$directory$nix_shell$golang$rust$python$git_branch$git_status$cmd_duration
        #   [└](fg:#${config.colorScheme.palette.base0A}) $os$character
        # '';
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

        directory = {
          format = "[](fg:overlay)[ $path ]($style)[](fg:overlay) ";
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

        cmd_duration = {
          format = "[ $duration ]($style)[ 󱑂  ](bg:#ca9ee6 fg:#24273a)";
        };

        character = {
          success_symbol = "[ •   ](#8caaee bold)";
          error_symbol = "[ •  󰅙 ](#e78284 bold)";
          # success_symbol = "[ •   ](fg:#${config.colorScheme.palette.base0A}) ";
          # error_symbol = "[ •  󰅙 ](fg:#${config.colorScheme.palette.base08})[✘](fg:#${config.colorScheme.palette.base09})[├->](fg:#${config.colorScheme.palette.base0F}) ";
        };

        fill = {
          style = "fg:overlay";
          symbol = " ";
        };

        username = {
          # show_always = false;
          # style_user = "fg:#${config.colorScheme.palette.base03}";
          # style_root = "fg:#${config.colorScheme.palette.base03}";
          # format = "[$user@]($style)";
          disabled = false;
          format = "[](fg:overlay)[ 󰧱 $user ]($style)[](fg:overlay) ";
          show_always = true;
          style_root = "bg:overlay fg:iris";
          style_user = "bg:overlay fg:iris";
        };

        # hostname = {
        #   ssh_only = false;
        #   format = "[$hostname]($style) ";
        #   style = "fg:#${config.colorScheme.palette.base0C}";
        # };

        # os = with config.colorScheme.palette; {
        #   disabled = false;
        #   style = "fg:#${base0D}";
        #   symbols = {
        #     # Arch = "[ ]($style)";
        #     NixOS = "[ ]($style)";
        #     # Linux = "[  ](fg:fg $style)";
        #   };
        # };

        git_branch = {
          format = "[](fg:overlay)[ $symbol $branch ]($style)[](fg:overlay) ";
          # style = "fg:#${config.colorScheme.palette.base0E}";
          style = "bg:overlay fg:foam";
          symbol = "";
        };

        git_status = {
          disabled = false;
          style = "bg:overlay fg:love";
          # style = "fg:#${config.colorScheme.palette.base0E}";
          format = "[](fg:overlay)([$all_status$ahead_behind]($style))[](fg:overlay) ";
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

        # git_status = {
        #   conflicted = " ";
        #   ahead = " ";
        #   behind = " 󱊾 ";
        #   diverged = "󱡷 ";
        #   untracked = "";
        #   stashed = " ";
        #   modified = " ";
        #   staged = " ";
        #   renamed = " ";
        #   deleted = "󰆴 ";
        #   style = "fg:#${config.colorScheme.palette.base0E}";
        # };

        # Languages
        golang = {
          format = "[$symbol $version]($style)";
          symbol = " ";
          style = "fg:#${config.colorScheme.palette.base0C}";
        };

        rust = {
          format = "[$symbol$version]($style)";
          symbol = "";
          style = "fg:#${config.colorScheme.palette.base0C}";
        };

        python = {
          format = "[$symbol$version]($style)";
          symbol = "";
          style = "fg:#${config.colorScheme.palette.base0A}";
        };

        nix_shell = {
          format = "[$symbol$state($name)]($style) ";
          style = "fg:#${config.colorScheme.palette.base0D}";
          symbol = " ";
          impure_msg = "";
          pure_msg = "pure ";
        };
      };
    };
  };
}
