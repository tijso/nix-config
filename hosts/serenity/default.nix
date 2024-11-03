{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ../applications
    ../common
    ../development
    ../evnironments
    ../users/global.nix
  ];

  system.stateVersion = "23.11";
}
