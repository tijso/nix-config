{ lib, config, ... }:
with lib;
{
  options.myHome.cli.nushell = {
    enable = mkEnableOption "Enable Nushell";

    extraConfig = mkOption {
      type = types.lines;
      default = "";
      description = "Extra configuration for Nushell";
    };

    extraAliases = mkOption {
      type = types.attrsOf types.str;
      default = { };
      description = "Additional shell aliases";
    };
  };

  config = mkIf config.myHome.cli.nushell.enable {
    programs.nushell = {
      enable = true;
      shellAliases = {
        config = "cd ~/nix-config";
        rebuild = "sudo nixos-rebuild switch --flake ~/nix-config#serenity";
        rebuild-home = "home-manager switch --flake ~/nix-config#tijso@serenity";
        update = "cd ~/nix-config nix flake update";
        clean = "sudo nix-collect-garbage -d nix store optimise";
        search = "nix search nixpkgs";
        ls = "eza -l";
        la = "eza -a";
        ll = "eza -la";
        lt = "eza --tree";
        vi = "nvim";
        vim = "nvim";
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
      } // config.myHome.cli.nushell.extraAliases;

      configFile.text = ''
        $env.config = ($env.config | upsert show_banner false)
        $env.config = ($env.config | upsert edit_mode vi)

        def ".." [] { cd .. }
        def "..." [] { cd ../.. }

        def update [] { cd ~/nix-config; nix flake update }
        def clean [] { sudo nix-collect-garbage -d; nix store optimise }

        ${config.myHome.cli.nushell.extraConfig}
      '';
    };
  };
}
