{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix

    ../common
    ../users/global.nix
    # ../../development
    ../../environments
  ];

  system.stateVersion = "23.11";
}
