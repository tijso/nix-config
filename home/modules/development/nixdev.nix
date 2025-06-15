{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
{
  options.myHome.development.nixdev.enable = mkEnableOption "Enable Nix Developement Packages";
  config = mkIf config.myHome.development.nixdev.enable {
    home.packages = with pkgs; [
      alejandra
      niv
      nix-prefetch
      nix-prefetch-git
      nix-doc
      nix-update
      nix-template
      manix
      deadnix
      patchelf
      nil
      nix-ld
      nix-top
      nix-tree
      nix-diff
      nixpkgs-lint
    ];
  };
}
