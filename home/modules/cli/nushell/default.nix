{ lib, config, ... }:
with lib;
{
  options.myHome.cli.nushell = {
    enable = mkEnableOption "Enable Nushell";
  };

  config = mkIf config.myHome.cli.nushell.enable {
    programs.nushell = {
      enable = true;

      # Your essential aliases
      shellAliases = {
        # File operations
        ls = "eza -l";
        la = "eza -a";
        ll = "eza -la";
        lt = "eza --tree";

        # Editors
        vi = "nvim";
        vim = "nvim";

        # Better CLI tools
        cat = "bat --paging=never";
        man = "tldr";
        grep = "rg";
        find = "fd";

        # Git and tools
        lg = "lazygit";
        img = "wezterm imgcat";
      };

      # Basic configuration - this is what most users start with
      configFile.text = ''
        # Hide banner on startup
        $env.config = ($env.config | upsert show_banner false)

        # Use vi-style editing
        $env.config = ($env.config | upsert edit_mode vi)

        # Basic navigation shortcuts
        def ".." [] { cd .. }
        def "..." [] { cd ../.. }

        # Simple Nix and project shortcuts
        def config [] { cd ~/nix-config }
        def rebuild [] { sudo nixos-rebuild switch --flake ~/nix-config#serenity }
        def rebuild-home [] { home-manager switch --flake ~/nix-config#tijso@serenity }
        def update [] { cd ~/nix-config; nix flake update }
        def clean [] { sudo nix-collect-garbage -d; nix store optimise }
        def search [pkg: string] { nix search nixpkgs $pkg }

        # Project navigation
        def personal [] { cd ~/projects/personal }
        def github [] { cd ~/projects/personal/github }
        def gitlab [] { cd ~/projects/personal/gitlab }
      '';
    };
  };
}
