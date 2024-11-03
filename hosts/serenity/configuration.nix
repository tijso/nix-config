{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    # Hardware
    ./hardware-configuration.nix

    # Core system components
    ../../modules/system
    ../common
    ../users/global.nix

    # Development/Lsp
    ../../modules/development

    # Utilities
    ../../modules/utilities
  ];

  networking.hostName = "serenity";
  services.fstrim.enable = true;

  system.stateVersion = "23.11";
}
