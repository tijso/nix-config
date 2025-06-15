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
    ../users/global.nix
    ../../development
    ../../environments
  ];

  myModules = {
    thunar.enable = true;
    stylix.enable = false;
    desktop = {
      cosmic.enable = false;
      gnome.enable = true;
      hyprland.enable = false;
    };
    core = { };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "23.11";
}
