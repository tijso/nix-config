{
  config,
  pkgs,
  lib,
  ...
}:
with lib;
{
  options.myModules.desktop.enable = mkEnableOption "Enable Hyprland";
  config = mkIf config.myModules.hyprland.enable {
    services.displayManager.sddm = {
      enable = true;
      enableHidpi = true;
      autoNumlock = true;
      wayland.enable = true;
      theme = "catppuccin";
    };

    programs.hyprland.enable = true;
    security.pam.services.sddm.enableGnomeKeyring = true;

    xdg.portal = {
      enable = true;
      config.common.default = "*";
      wlr.enable = true;
      xdgOpenUsePortal = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-hyprland
        pkgs.xdg-desktop-portal-gtk
      ];
    };

    environment.systemPackages = with pkgs; [
      catppuccin-sddm
      sddm-sugar-dark
      libsForQt5.qt5.qtgraphicaleffects
    ];
  };
}
