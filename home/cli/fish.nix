{ lib, config, ... }:
with lib;
let
  cfg = config.modules.cli.fish;
in
{
  options.modules.cli.fish.enable = mkEnableOption "Enable Fish";
  config = mkIf cfg.enable {
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

        # CoolNight
        set -g fish_color_normal CBE0F0
        set -g fish_color_command 44FFB1
        set -g fish_color_quote FFE073
        set -g fish_color_redirection 24EAF7
        set -g fish_color_end 0FC5ED
        set -g fish_color_error E52E2E
        set -g fish_color_param A277FF
        set -g fish_color_comment 214969
        set -g fish_color_match 24EAF7
        set -g fish_color_selection --background=033259
        set -g fish_color_search_match --background=033259
        set -g fish_color_history_current --bold
        set -g fish_color_operator 0FC5ED
        set -g fish_color_escape A277FF
        set -g fish_color_cwd 44FFB1
        set -g fish_color_cwd_root E52E2E
        set -g fish_color_valid_path --underline
        set -g fish_color_autosuggestion 214969
        set -g fish_color_user 44FFB1
        set -g fish_color_host 0FC5ED
        set -g fish_color_cancel E52E2E
        set -g fish_color_host_remote FFE073

        # Background and pager colors
        set -g fish_pager_color_prefix 24EAF7
        set -g fish_pager_color_completion CBE0F0
        set -g fish_pager_color_description 214969
        set -g fish_pager_color_progress 214969
        set -g fish_pager_color_secondary_background 011423
        set -g fish_pager_color_secondary_prefix 24EAF7
        set -g fish_pager_color_secondary_completion CBE0F0
        set -g fish_pager_color_secondary_description 214969
        set -g fish_pager_color_selected_background --background=033259
        set -g fish_pager_color_selected_prefix 24EAF7
        set -g fish_pager_color_selected_completion CBE0F0
        set -g fish_pager_color_selected_description 214969

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

        # Tokonight_Moon
        # set -g fish_color_normal c8d3f5
        # set -g fish_color_command 86e1fc
        # set -g fish_color_keyword c099ff
        # set -g fish_color_quote ffc777
        # set -g fish_color_redirection c8d3f5
        # set -g fish_color_end ff966c
        # set -g fish_color_option c099ff
        # set -g fish_color_error ff757f
        # set -g fish_color_param fca7ea
        # set -g fish_color_comment  636da6
        # set -g fish_color_selection --background=2d3f76
        # set -g fish_color_search_match --background=2d3f76
        # set -g fish_color_operator c3e88d
        # set -g fish_color_escape c099ff
        # set -g fish_color_autosuggestion 636da6

        # Completion Pager Colors
        # set -g fish_pager_color_progress 636da6
        # set -g fish_pager_color_prefix 86e1fc
        # set -g fish_pager_color_completion c8d3f5
        # set -g fish_pager_color_description 636da6
        # set -g fish_pager_color_selected_background --background=2d3f76 

        # Nightfly
        # set -g fish_color_autosuggestion 4b6479
        # set -g fish_color_cancel 4b6479
        # set -g fish_color_command 7cb3ff
        # set -g fish_color_comment 7c8f8f --italics
        # set -g fish_color_cwd 87d787
        # set -g fish_color_cwd_root ff5874
        # set -g fish_color_end 7c8f8f
        # set -g fish_color_error fc514e
        # set -g fish_color_escape 7c8f8f
        # set -g fish_color_history_current c3ccdc --background=1d3b53
        # set -g fish_color_host d6deeb
        # set -g fish_color_host_remote d6deeb
        # set -g fish_color_keyword c792ea
        # set -g fish_color_match c3ccdc --background=1d3b53
        # set -g fish_color_normal bdc1c6
        # set -g fish_color_operator ff5874
        # set -g fish_color_option bdc1c6
        # set -g fish_color_param 61d5ae
        # set -g fish_color_quote ecc48d
        # set -g fish_color_redirection a1cd5e
        # set -g fish_color_search_match --background=1d3b53
        # set -g fish_color_selection --background=1d3b53
        # set -g fish_color_status fc514e
        # set -g fish_color_user 21c7a8
        # set -g fish_color_valid_path

        # Completion pager colors.
        # set -g fish_pager_color_completion c3ccdc
        # set -g fish_pager_color_description 7c8f8f
        # set -g fish_pager_color_prefix 82aaff
        # set -g fish_pager_color_progress 7c8f8f
        # set -g fish_pager_color_selected_background --background=1d3b53
        # set -g fish_pager_color_selected_completion d6deeb
        # set -g fish_pager_color_selected_description d6deeb

        # Carbonfox
        # set -g fish_color_normal f2f4f8
        # set -g fish_color_command 33b1ff
        # set -g fish_color_keyword ff7eb6
        # set -g fish_color_quote 08bdba
        # set -g fish_color_redirection f2f4f8
        # set -g fish_color_end 3ddbd9
        # set -g fish_color_error ee5396
        # set -g fish_color_param be95ff
        # set -g fish_color_comment 6e6f70
        # set -g fish_color_selection --background=2a2a2a
        # set -g fish_color_search_match --background=2a2a2a
        # set -g fish_color_operator $green
        # set -g fish_color_escape ff7eb6
        # set -g fish_color_autosuggestion 6e6f70

        # Completion Pager Colors
        # set -g fish_pager_color_progress 6e6f70
        # set -g fish_pager_color_prefix 33b1ff
        # set -g fish_pager_color_completion f2f4f8
        # set -g fish_pager_color_description 6e6f70

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
        ll = "eza -l";
        lla = "eza -la";
        la = "eza -a";
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
  };
}
