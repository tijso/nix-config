{ pkgs, config, ... }:

{
  imports = [
    ./gtk.nix
    ./wofi.nix
    # ./hyprland
  ];
}
