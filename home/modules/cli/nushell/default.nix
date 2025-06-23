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
        # Simple single-command aliases only
        ls = "eza -l";
        la = "eza -a";
        ll = "eza -la";
        lt = "eza --tree";
        vi = "nvim";
        vim = "nvim";
        cat = "bat --paging=never";
        man = "tldr";
        grep = "rg";
        find = "fd";
        lg = "lazygit";
        img = "wezterm imgcat";
      } // config.myHome.cli.nushell.extraAliases;

      configFile.text = ''
        # Basic config
        $env.config = ($env.config | upsert show_banner false)
        $env.config = ($env.config | upsert edit_mode vi)

        # Navigation functions
        def ".." [] { cd .. }
        def "..." [] { cd ../.. }

        # Multi-command functions (these can't be simple aliases)
        def config [] { cd ~/nix-config }
        def rebuild [] { sudo nixos-rebuild switch --flake ~/nix-config#serenity }
        def rebuild-home [] { home-manager switch --flake ~/nix-config#tijso@serenity }
        def update [] { cd ~/nix-config; nix flake update }
        def clean [] { sudo nix-collect-garbage -d; nix store optimise }
        def search [query: string] { nix search nixpkgs $query }
        def personal [] { cd ~/projects/personal }
        def github [] { cd ~/projects/personal/github }
        def gitlab [] { cd ~/projects/personal/gitlab }

        ${config.myHome.cli.nushell.extraConfig}
      '';
    };
  };
}
