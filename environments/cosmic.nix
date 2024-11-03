{
  pkgs,
  lib,
  inputs,
  ...
}: {
  services.desktopManager.cosmic.enable = true;
  services.displayManager.cosmic-greeter.enable = true;
}
