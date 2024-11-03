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
    ../desktop
    ../users/global.nix

    # Development/Lsp
    ../../modules/development

    # Utilities
    ../../modules/utilities
  ];

  system.stateVersion = "23.11";
}
