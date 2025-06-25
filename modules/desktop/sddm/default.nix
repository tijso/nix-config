{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.myModules.desktop.sddm.enable = mkEnableOption "Enable Sddm";
  config = mkIf config.myModules.desktop.sddm.enable {
    environment.systemPackages = with pkgs; [
      catppuccin-sddm
      sddm-sugar-dark
      libsForQt5.qt5.qtgraphicaleffects
    ];
    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      enableHidpi = true;
      autoNumlock = true;
      theme = "sugar-dark";
      settings = {
        Theme = {
          Current = "sugar-dark";
          Background = "${config.stylix.image}";
          ScreenWidth = "3849";
          ScreenHeight = "2160";
          ScaleImageCropped = "true";
          DimBackgroundImage = "0.0";
        };
      };
    };
  };
}
