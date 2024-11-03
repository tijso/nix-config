{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    # Hardware
    ./hardware-configuration.nix

    # Core system components
    ../common
    ../evnironments
    ../users/global.nix

    # Development/Lsp
    ../../modules/development
  ];

  system.stateVersion = "23.11";
}
