{
  programs.fish = {
    enable = true;
    shellInit = ''
      fish_default_key_bindings
    '';
    interactiveShellInit = ''
      set fish_greeting
      #fastfetch

      # Catppuccin
      # set -g fish_color_normal cdd6f4
      # set -g fish_color_command 89b4fa
      # set -g fish_color_param f2cdcd
      # set -g fish_color_keyword f38ba8
      # set -g fish_color_quote a6e3a1
      # set -g fish_color_end fab387
      # set -g fish_color_comment 7f849c
      # set -g fish_color_error f38ba8
      # set -g fish_color_gray 6c7086
      # set -g fish_color_selection --background=313244
      # set -g fish_color_search_match --background=313244
      # set -g fish_color_option a6e3a1
      # set -g fish_color_operator f5c2e7
      # set -g fish_color_escape eba0ac
      # set -g fish_color_autosuggestion 6c7086
      # set -g fish_color_cancel f38ba8
      # set -g fish_color_cwd f9e2af
      # set -g fish_color_user 94e2d5
      # set -g fish_color_host 89b4fa
      # set -g fish_color_host_remote a6e3a1
      # set -g fish_color_status f38ba8

      # Completion Pager Colors
      # set -g fish_pager_color_progress    6c7086
      # set -g fish_pager_color_prefix      f5c2e7
      # set -g fish_pager_color_completion  cdd6f4
      # set -g fish_pager_color_description 6c7086

      # Tokonight
      set -g fish_color_normal c0caf5
      set -g fish_color_command 7dcfff
      set -g fish_color_keyword bb9af7
      set -g fish_color_quote e0af68
      set -g fish_color_redirection c0caf5
      set -g fish_color_end ff9e64
      set -g fish_color_option bb9af7
      set -g fish_color_error f7768e
      set -g fish_color_param 9d7cd8
      set -g fish_color_comment 565f89
      set -g fish_color_selection --background=283457
      set -g fish_color_search_match --background=283457
      set -g fish_color_operator 9ece6a
      set -g fish_color_escape bb9af7
      set -g fish_color_autosuggestion 565f89

      # Completion Pager Colors
      set -g fish_pager_color_progress 565f89
      set -g fish_pager_color_prefix 7dcfff
      set -g fish_pager_color_completion c0caf5
      set -g fish_pager_color_description 565f89
      set -g fish_pager_color_selected_background --background=283457


      # Kanagawa
      # set -g fish_color_normal DCD7BA
      # set -g fish_color_command 7AA89F
      # set -g fish_color_keyword D27E99
      # set -g fish_color_quote C0A36E
      # set -g fish_color_redirection DCD7BA
      # set -g fish_color_end FF9E64
      # set -g fish_color_error C34043
      # set -g fish_color_param 957FB8
      # set -g fish_color_comment 727169
      # set -g fish_color_selection --background=2D4F67
      # set -g fish_color_search_match --background=2D4F67
      # set -g fish_color_operator 76946A
      # set -g fish_color_escape D27E99
      # set -g fish_color_autosuggestion 727169

      # Completion Pager Colors
      # set -g fish_pager_color_progress 727169
      # set -g fish_pager_color_prefix 7AA89F
      # set -g fish_pager_color_completion DCD7BA
      # set -g fish_pager_color_description 727169
    '';

    shellAliases = {
      home = "cd ~/";
      config = "cd ~/nix-config";
      personal = "cd ~/projects/personal";
      github = "cd ~/projects/personal/github";
      gitlab = "cd ~/projects/personal/gitlab";
      mkdir = "mkdir -p";
      cat = "bat --paging=never";
      man = "tldr";
      grep = "rg";
      find = "fd";
      lg = "lazygit";
      img = "wezterm imgcat";

      # List Commands
      ls = "eza";
      la = "eza -lah";
      lt = "eza --tree";

      # Neovim
      vi = "nvim";
      vim = "nvim";

      # Nix
      update = "sudo nix flake update";
      rebuild = "sudo nixos-rebuild switch --flake .#serenity && notify-send \"Done\"";
      hmr = "home-manager switch --flake .#tijso@serenity";
      news = "home-manager news --flake .#tijso@serenity";

      # Cli Trash Commands
      tl = "trash-list";
      te = "trash-empty";
      tr = "trash-restore";
      tm = "trash-rm";
    };
  };
}
