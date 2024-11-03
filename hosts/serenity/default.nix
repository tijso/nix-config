{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ../common
    ../users/global.nix
    ../../applications
    ../../development
    ../../environments
  ];

  system.stateVersion = "23.11";
}
