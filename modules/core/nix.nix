{
  config,
  lib,
  ...
}:
with lib;
{
  options.myModules.core.nix.enable = mkEnableOption "Enable Nix";

  config = mkIf config.myModules.core.nix.enable {
    nix = {
      settings = {
        auto-optimise-store = true;
        experimental-features = [
          "nix-command"
          "flakes"
        ];
        substituters = [
          "https://cache.nixos.org/"
          "https://prayag2.cachix.org/"
          "https://nix-community.cachix.org"
          "https://hyprland.cachix.org"
          "https://niri.cachix.org/ https://cache.nixos.org/"
        ];
        trusted-public-keys = [
          "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
          "prayag2.cachix.org-1:Lu+JhgBkHI0vNG3VcZJAXTniydou+5bUiqf67kEcA4g="
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
          "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
          "niri.cachix.org-1:Wv0OmqXIU4e6X/mx2KViV9q/U/kLyRjX6XcbxfqAbM0= cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        ];
      };
      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-then 7d";
      };
    };
  };
}
