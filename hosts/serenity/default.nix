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
  ];

  myModules = {
    core = {
      audio.enable = true;
      bluetooth.enable = true;
      boot.enable = true;
      gpu.enable = true;
      network.enable = true;
      nix.enable = true;
      pkgs.enable = true;
      security.enable = true;
      services.enable = true;
    };

    desktop = {
      cosmic.enable = false;
      gnome.enable = true;
      hyprland.enable = false;
      niri.enable = false;
    };

    development.enable = true;
    # stylix.enable = false;
    thunar.enable = true;
  };

  system.stateVersion = "23.11";
}
