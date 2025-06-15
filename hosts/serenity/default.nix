{
  pkgs,
  ...
}:
{
  imports = [
    # ./disks.nix
    ./hardware-configuration.nix
    ./users.nix

    ../../modules
    ../common
    # ../users/global.nix
    ../../development
    ../../environments
  ];

  myModules = {
    core = {
      audio.enable = true;
      bluetooth.enable = true;
      boot.enable = true;
      gpu.enable = true;
    };

    desktop = {
      cosmic.enable = false;
      gnome.enable = true;
      hyprland.enable = false;
    };

    thunar.enable = true;
    stylix.enable = false;
  };

  system.stateVersion = "23.11";
}
