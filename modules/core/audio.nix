# { pkgs, ... }:
# {
#   hardware.enableAllFirmware = true;
#   services.pulseaudio.enable = false;
#   security.rtkit.enable = true;
#   services.pipewire = {
#     enable = true;
#     alsa.enable = true;
#     alsa.support32Bit = true;
#     pulse.enable = true;
#     wireplumber.enable = true;
#     jack.enable = true;
#   };
# }

{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
{
  options.myModules.core.hardware = {
    enable = mkEnableOption "Enable hardware configuration";

    audio = {
      enable = mkEnableOption "Enable audio configuration (PipeWire)";
    };

    firmware = {
      enable = mkEnableOption "Enable all firmware";
    };
  };

  config = mkIf cfg.enable {
    # Enable all firmware if requested
    hardware.enableAllFirmware = mkIf cfg.firmware.enable true;

    # Audio configuration
    services.pulseaudio.enable = mkIf cfg.audio.enable false;
    security.rtkit.enable = mkIf cfg.audio.enable true;

    services.pipewire = mkIf cfg.audio.enable {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
      jack.enable = true;
    };
  };
}
