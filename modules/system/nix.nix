{ inputs, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    nh
    nix-du
    nix-prefetch-git
    nix-prefetch-github
    # nixfmt-rfc-style
    nixpkgs-fmt
    nil
  ];

  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
  };

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
      substituters = ["https://hyprland.cachix.org"];
      trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    };
    gc ={
      automatic = true;
      dates = "weekly";
      options = "--delete-older-then 7d";
    };
  };
}
