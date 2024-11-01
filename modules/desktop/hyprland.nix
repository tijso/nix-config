{
  inputs,
  pkgs,
  lib,
  ...
}: {
  programs.hyprland.enable = true;

  services.xserver = {
    enable = true;
    xkb.layout = "us";
    xkb.variant = "";
    displayManager.sddm = {
      enable = true;
      theme = "sugar";
    };
  };

  xdg.portal = {
    enable = true;
    config.common.default = "*";
    wlr.enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [pkgs.xdg-desktop-portal-hyprland pkgs.xdg-desktop-portal-gtk];
  };

  environment.systemPackages = with pkgs; [
    catppuccin-sddm
    sddm-sugar-dark
    libsForQt5.qt5.qtgraphicaleffects
  ];
}
