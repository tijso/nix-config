# /etc/nixos/stylix.nix - ONLY system components
{
  lib,
  pkgs,
  config,
  ...
}:
with lib;
{
  options.myModules.stylix.enable = mkEnableOption "Enable system-level Stylix";
  config = mkIf config.myModules.stylix.enable {
    stylix = {
      enable = true;
      autoEnable = false;
      polarity = "dark";

      # System wallpaper and colors
      image = ./Berserk.png;
      base16Scheme = "./themes/rose-pine.yaml";

      targets = {
        grub.enable = true;
        plymouth.enable = true;
        greetd.enable = true;
        console.enable = true;

        # Basic system fonts
        fonts = {
          monospace = {
            name = "FiraCode Nerd Font";
            package = pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; };
          };
          sansSerif = {
            name = "Noto Sans";
            package = pkgs.noto-fonts;
          };
        };
      };
    };

  };
}
