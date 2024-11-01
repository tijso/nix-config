{
  pkgs,
  config,
  lib,
  ...
}: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    settings = {
      format = ''
        [┌](fg:#${config.colorScheme.palette.base0A}) $hostname$directory$nix_shell$golang$rust$python$git_branch$git_status$cmd_duration
        [└](fg:#${config.colorScheme.palette.base0A}) $os$character
      '';

      character = {
        format = "$symbol";
        success_symbol = "[->](fg:#${config.colorScheme.palette.base0A}) ";
        error_symbol = "[┤](fg:#${config.colorScheme.palette.base08})[✘](fg:#${config.colorScheme.palette.base09})[├->](fg:#${config.colorScheme.palette.base0F}) ";
      };

      username = {
        show_always = false;
        style_user = "fg:#${config.colorScheme.palette.base03}";
        style_root = "fg:#${config.colorScheme.palette.base03}";
        format = "[$user@]($style)";
      };

      hostname = {
        ssh_only = false;
        format = "[$hostname]($style) ";
        style = "fg:#${config.colorScheme.palette.base0C}";
      };

      directory = {
        truncation_length = 1;
        truncation_symbol = "";
        fish_style_pwd_dir_length = 1;
        style = "fg:#${config.colorScheme.palette.base07}";
      };

      os = with config.colorScheme.palette; {
        disabled = false;
        style = "fg:#${base0D}";
        symbols = {
          # Arch = "[ ]($style)";
          NixOS = "[ ]($style)";
          # Linux = "[  ](fg:fg $style)";
        };
      };

      git_branch = {
        style = "fg:#${config.colorScheme.palette.base0E}";
      };

      git_status = {
        conflicted = " ";
        ahead = " ";
        behind = " 󱊾 ";
        diverged = "󱡷 ";
        untracked = "";
        stashed = " ";
        modified = " ";
        staged = " ";
        renamed = " ";
        deleted = "󰆴 ";
        style = "fg:#${config.colorScheme.palette.base0E}";
      };

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
}
