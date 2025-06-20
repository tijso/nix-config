{ lib, config, ... }:
with lib;

{
  options.myHome.cli.nushell.enable = mkEnableOption "Enable Fish";
  config = mkIf config.myHome.cli.nushell.enable {
    programs.nushell = {
      enable = true;
      shellAliases = {
        # NixOS specific
        rebuild = "sudo nixos-rebuild switch --flake ~/nix-config#serenity";
        rebuild-home = "home-manager switch --flake ~/nix-config#tijso@serenity";
        update = "cd ~/nix-config && nix flake update";
        clean = "sudo nix-collect-garbage -d && nix store optimise";
        search = "nix search nixpkgs";

        # General aliases
        ll = "ls -la";
        la = "ls -la";
        ".." = "cd ..";
        "..." = "cd ../..";

        # Git shortcuts
        g = "git";
        gs = "git status";
        ga = "git add";
        gc = "git commit";
        gp = "git push";

        # Modern replacements
        cat = "bat";
        ls = "eza --icons";
        find = "fd";
        grep = "rg";
      };
    };
  };
}
