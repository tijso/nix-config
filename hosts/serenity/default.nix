{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix

    ../../modules
    ../common
    ../users/global.nix
    ../../development
    ../../environments
  ];

  myModules = {
    thunar.enable = true;
    # development.enable = false;
    # gaming.enable = false;
    # virtualization.enable = false;
  };

  system.stateVersion = "23.11";
}
