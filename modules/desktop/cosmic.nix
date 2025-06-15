{
  config,
  lib,
  ...
}:
with lib;
{
  options.myModules.desktop.cosmic.enable = mkEnableOption "Enable Cosmic";
  config = mkIf config.myModules.desktop.cosmic.enable {
    services = {
      desktopManager.cosmic.enable = true;
      displayManager.cosmic-greeter.enable = true;
    };
  };
}
