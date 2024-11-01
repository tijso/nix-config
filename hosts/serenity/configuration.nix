{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    # Hardware
    ./hardware-configuration.nix
    ../../modules/hardware

    # Core system components
    ../../modules/system

    # Desktop Evniroment
    ../../modules/desktop

    # Development/Lsp
    ../../modules/development

    # Utilities
    ../../modules/utilities
  ];

  networking.hostName = "serenity";

  system.stateVersion = "23.11"; # Did you read the comment?
}
