{
  config,
  lib,
  ...
}:
with lib;
{
  options.myModules.core.bluetooth.enable = mkEnableOption "Enable Bluetooth";

  config = mkIf config.myModules.core.bluetooth.enable {
    hardware.bluetooth = {
      enable = true;
      settings.General.Enable = "Source,Sink,Media,Socket";
    };
    services.blueman.enable = true;
  };
}
