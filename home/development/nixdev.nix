{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
{
  options.nixdev.enable = mkEnableOption "nix developement packages";
  config = mkIf config.nixdev.enable {
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
