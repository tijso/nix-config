{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.modules.development.nixdev;
in
{
  options.modules.development.nixdev.enable = mkEnableOption "Enable Nix Developement Packages";
  config = mkIf cfg.enable {
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
