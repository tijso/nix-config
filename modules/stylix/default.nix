{
  lib,
  config,
  ...
}:
with lib; {
  options.myModules.stylix.enable = mkEnableOption "Enable Stylix";
  config = mkIf config.myModules.stylix.enable {
    stylix = {
      enable = true;
      autoEnable = false;
      polarity = "dark";

      # System wallpaper and colors
      image = ./themes/Berserk.png;
      base16Scheme = ./themes/rose-pine.yaml;

      targets = {
        console.enable = true;
        # greetd.enable = true;
        grub.enable = true;
        plymouth.enable = true;
      };
    };
  };
}
