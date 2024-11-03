{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ../common
    ../users/global.nix
    ../../software
    ../../development
    ../../environments
  ];

  system.stateVersion = "23.11";
}
