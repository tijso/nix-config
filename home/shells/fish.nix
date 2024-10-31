{
  pkgs,
  config,
  ...
}: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      #fastfetch

      # Catppuccin
      set -g fish_color_normal cdd6f4
      set -g fish_color_command 89b4fa
      set -g fish_color_param f2cdcd
      set -g fish_color_keyword f38ba8
      set -g fish_color_quote a6e3a1
      set -g fish_color_end fab387
      set -g fish_color_comment 7f849c
      set -g fish_color_error f38ba8
      set -g fish_color_gray 6c7086
      set -g fish_color_selection --background=313244
      set -g fish_color_search_match --background=313244
      set -g fish_color_option a6e3a1
      set -g fish_color_operator f5c2e7
      set -g fish_color_escape eba0ac
      set -g fish_color_autosuggestion 6c7086
      set -g fish_color_cancel f38ba8
      set -g fish_color_cwd f9e2af
      set -g fish_color_user 94e2d5
      set -g fish_color_host 89b4fa
      set -g fish_color_host_remote a6e3a1
      set -g fish_color_status f38ba8

      # Completion Pager Colors
      set -g fish_pager_color_progress    6c7086
      set -g fish_pager_color_prefix      f5c2e7
      set -g fish_pager_color_completion  cdd6f4
      set -g fish_pager_color_description 6c7086

      # Kanagawa
      # set -l foreground DCD7BA normal
      # set -l selection 2D4F67 brcyan
      # set -l comment 727169 brblack
      # set -l red C34043 red
      # set -l orange FF9E64 brred
      # set -l yellow C0A36E yellow
      # set -l green 76946A green
      # set -l purple 957FB8 magenta
      # set -l cyan 7AA89F cyan
      # set -l pink D27E99 brmagenta

      # Syntax Highlighting Colors
      # set -g fish_color_normal $foreground
      # set -g fish_color_command $cyan
      # set -g fish_color_keyword $pink
      # set -g fish_color_quote $yellow
      # set -g fish_color_redirection $foreground
      # set -g fish_color_end $orange
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
    '';

    shellAliases = {
      cat = "bat -p";
      img = "wezterm imgcat";
      update = "sudo nix flake update";
      rebuild = "sudo nixos-rebuild switch --flake .#serenity && notify-send \"Done\"";
      hmr = "home-manager switch --flake .#tijso@serenity";
      ls = "eza -lg";
      la = "eza -la";
      lt = "eza --tree";
      tl = "trash-list";
      te = "trash-empty";
      tr = "trash-restore";
      tm = "trash-rm";
    };
  };
}
