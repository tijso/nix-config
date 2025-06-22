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
      polarity = "dark";

      # System wallpaper and colors
      image = ./assets/wallpapers/system-wallpaper.png;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";

      targets = {
        grub.enable = true;
        plymouth.enable = true;
        lightdm.enable = true;
        console.enable = true;

        # Home-Manager takes take of the rest
        gtk.enable = false;
        qt.enable = false;
        firefox.enable = false;
        fuzzel.enable = false;
        waybar.enable = false;
      };

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
}
