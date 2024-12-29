{ pkgs, config, ... }:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    settings = {
      add_newline = true;
      character = {
        success_symbol = "[❯](#cba6f7)[❯](#89dceb)[❯](#f2cdcd)";
        error_symbol = "[❯](#fab387)[❯](#eba0ac)[❯](#6c7086)";
      };
      username = {
        show_always = true;
        disabled = true;
        format = "[$user@]($style)";
        style_user = "#585b70";
      };
      hostname = {
        ssh_only = false;
        format = "[$hostname]($style) ";
        style = "#f5c2e7";
      };
      directory = {
        truncation_length = 1;
        truncation_symbol = "";
        fish_style_pwd_dir_length = 1;
      };
      git_branch = {
        style = "#cba6f7";
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
        style = "#7f849c";
      };
      golang = {
        symbol = "ﳑ ";
        style = "#212736";
        format = "[[ $symbol ($version) ](fg:#89b4fa bg:#6c7086)]($style)";
      };
      rust = {
        format = "[$symbol$version]($style)";
        symbol = " ";
        style = "#94e2d5";
      };
      python = {
        format = "[$symbol$version]($style)";
        symbol = "󰌠 ";
        style = "#94e2d5";
      };
    };
  };
}
