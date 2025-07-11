{
  pkgs,
  config,
  lib,
  ...
}:
with lib; {
  options.myModules.desktop.gnome.enable = mkEnableOption "Enable Gnome";
  config = mkIf config.myModules.desktop.gnome.enable {
    services.displayManager.gdm = {
      enable = true;
      wayland = true;
    };
    services.desktopManager.gnome.enable = true;
    environment.gnome.excludePackages = with pkgs; [
      gnome-tour
      gnome-photos
      tali # poker game
      iagno # go game
      geary # Mail Client
      hitori # sudoku game
      atomix # puzzle game
      yelp # Help view
      gnome-initial-setup
      gnome-music # Music app
      totem # video player
      eog # Image Viewer
    ];

    environment.systemPackages = with pkgs; [
      gnome-disk-utility
      gnome-settings-daemon
      gnome-shell-extensions
      gnome-tweaks
      gnomeExtensions.appindicator
      gnomeExtensions.blur-my-shell
      gnomeExtensions.compact-top-bar
      gnomeExtensions.dash-to-panel
      gnomeExtensions.forge
      gnomeExtensions.just-perfection
      gnomeExtensions.tray-icons-reloaded
      gnomeExtensions.vitals
      gnomeExtensions.window-calls
      gradience
    ];
  };
}
