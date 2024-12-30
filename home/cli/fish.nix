{
  programs.fish = {
    enable = true;
    shellInit = ''
      fish_default_key_bindings
    '';
    interactiveShellInit = ''
      set fish_greeting
      # fastfetch

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

      # Rose-Pine
      set -g fish_color_normal e0def4
      set -g fish_color_command c4a7e7
      set -g fish_color_keyword 9ccfd8
      set -g fish_color_quote f6c177
      set -g fish_color_redirection 31748f
      set -g fish_color_end 908caa
      set -g fish_color_error eb6f92
      set -g fish_color_param ebbcba
      set -g fish_color_comment 908caa
      # set -g fish_color_match --background=brblue
      set -g fish_color_selection --reverse
      # set -g fish_color_history_current --bold
      set -g fish_color_operator e0def4
      set -g fish_color_escape 31748f
      set -g fish_color_autosuggestion 908caa
      set -g fish_color_cwd ebbcba
      # set -g fish_color_cwd_root red
      set -g fish_color_user f6c177
      set -g fish_color_host 9ccfd8
      set -g fish_color_host_remote c4a7e7
      set -g fish_color_cancel e0def4
      set -g fish_color_search_match --background=191724
      set -g fish_color_valid_path

      # Completion Pager Colors
      set -g fish_pager_color_progress ebbcba
      set -g fish_pager_color_background --background=1f1d2e
      set -g fish_pager_color_prefix 9ccfd8
      set -g fish_pager_color_completion 908caa
      set -g fish_pager_color_description 908caa
      set -g fish_pager_color_secondary_background
      set -g fish_pager_color_secondary_prefix
      set -g fish_pager_color_secondary_completion
      set -g fish_pager_color_secondary_description
      set -g fish_pager_color_selected_background --background=26233a
      set -g fish_pager_color_selected_prefix 9ccfd8
      set -g fish_pager_color_selected_completion e0def4
      set -g fish_pager_color_selected_description e0def4

      # Eldritch
      # set -g fish_color_normal ebfafa
      # set -g fish_color_command 37f499
      # set -g fish_color_keyword a48cf2
      # set -g fish_color_quote f1fc79
      # set -g fish_color_redirection ebfafa
      # set -g fish_color_end a48cf2
      # set -g fish_color_option f7c67f
      # set -g fish_color_error f16c75
      # set -g fish_color_param 04d1f9
      # set -g fish_color_comment 7081d0
      # set -g fish_color_selection --background=76639e
      # set -g fish_color_search_match --background=76639e
      # set -g fish_color_operator a48cf2
      # set -g fish_color_escape a48cf2
      # set -g fish_color_autosuggestion 7081d0
      # set -g fish_color_status f16c75
      # set -g fish_color_cancel f16c75 --reverse
      # set -g fish_color_history_current --bold
      # set -g fish_color_valid_path --underline

      # Default prompt colors
      # set -g fish_color_cwd a48cf2
      # set -g fish_color_cwd_root f265b5
      # set -g fish_color_host 04d1f9
      # set -g fish_color_host_remote 04d1f9
      # set -g fish_color_user 37f499

      # Completion Pager Colors
      # set -g fish_pager_color_progress 7081d0
      # set -g fish_pager_color_prefix 04d1f9
      # set -g fish_pager_color_completion ebfafa
      # set -g fish_pager_color_description 7081d0
      # set -g fish_pager_color_selected_background --background=76639e

      # Tokonight
      # set -l foreground c0caf5
      # set -l selection 283457
      # set -l comment 565f89
      # set -l red f7768e
      # set -l orange ff9e64
      # set -l yellow e0af68
      # set -l green 9ece6a
      # set -l purple 9d7cd8
      # set -l cyan 7dcfff
      # set -l pink bb9af7

      # Syntax Highlighting Colors
      # set -g fish_color_normal $foreground
      # set -g fish_color_command $cyan
      # set -g fish_color_keyword $pink
      # set -g fish_color_quote $yellow
      # set -g fish_color_redirection $foreground
      # set -g fish_color_end $orange
      # set -g fish_color_option $pink
      # set -g fish_color_error $red
      # set -g fish_color_param $purple
      # set -g fish_color_comment $comment
      # set -g fish_color_selection --background=$selection
      # set -g fish_color_search_match --background=$selection
      # set -g fish_color_operator $green
      # set -g fish_color_escape $pink
      # set -g fish_color_autosuggestion $comment

      # Completion Pager Colors
      # set -g fish_pager_color_progress $comment
      # set -g fish_pager_color_prefix $cyan
      # set -g fish_pager_color_completion $foreground
      # set -g fish_pager_color_description $comment
      # set -g fish_pager_color_selected_background --background=$selection 

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
