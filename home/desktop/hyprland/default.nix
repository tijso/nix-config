{ inputs, pkgs, config, lib, ... }:

{

  imports = [
    # ./binds.nix
    # ./rules.nix
    # ./general.nix
    # ./theme.nix
    # ./animations.nix
  ];

  home.packages  = with pkgs; [
    clipse
    grim
    slurp
    swappy
    swaynotificationcenter
    swww
    wl-clipboard
    wl-color-picker
    wlr-randr
    wayland-utils
    wayland-protocols
    ydotool
    # sugar.sddm-sugar-dark # Name: sugar-dark
    # tokyo-night # Name: tokyo-night-sddm
    # libsForQt5.qt5.qtgraphicaleffects
   ];

  # programs.hyprland = {
  #   enable = true;
  #   xwayland.enable = true;
  #   package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  #   portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
  # };

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    # plugins = [ inputs.hyprspace.packages.${pkgs.system}.Hyprspace ];
    # catppuccin.enable = true;
  };

}
