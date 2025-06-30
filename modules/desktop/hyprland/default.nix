{
  config,
  pkgs,
  lib,
  ...
}:
with lib; {
  imports = [./sddm];

  options.myModules.desktop.hyprland.enable = mkEnableOption "Enable Hyprland";
  config = mkIf config.myModules.desktop.hyprland.enable {
    programs.hyprland.enable = true;

    services = {
      gnome.gnome-keyring.enable = lib.mkForce false;
      gnome.gcr-ssh-agent.enable = lib.mkForce false;
    };

    xdg.portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-hyprland
        pkgs.xdg-desktop-portal-gtk
      ];
      config = {
        common = {
          default = ["hyprland" "gtk"];
        };
        hyprland = {
          default = ["hyprland" "gtk"];
        };
      };
    };
  };
}
