{
  inputs,
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [
    ./binds.nix
    ./rules.nix
    ./general.nix
    ./theme.nix
    ./animations.nix
  ];

  home.packages = with pkgs; [
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
  ];

}
