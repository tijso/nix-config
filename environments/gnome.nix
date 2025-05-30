{ pkgs, ... }:
{
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
    pkgs.gnome-shell-extensions
    pkgs.gnome-tweaks
  ];
}
