{
  pkgs,
  lib,
  inputs,
  ...
}:
with lib;
{
  options.myModules.desktop.enable = mkEnableOption "Enable Cosmic";
  services = {
    desktopManager.cosmic.enable = true;
    displayManager.cosmic-greeter.enable = true;
  };
}
