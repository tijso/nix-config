{
  config,
  lib,
  ...
}:
with lib; {
  options.myModules.core.audio = {
    enable = mkEnableOption "Enable audio configuration";
    audio = {
      enable = mkEnableOption "Enable audio configuration (PipeWire)";
    };
    firmware = {
      enable = mkEnableOption "Enable all firmware";
    };
  };
  config = mkIf config.myModules.core.audio.enable {
    # Enable all firmware if requested
    hardware.enableAllFirmware = mkIf config.myModules.core.audio.firmware.enable true;
    # Audio configuration
    services.pulseaudio.enable = mkIf config.myModules.core.audio.audio.enable false;
    security.rtkit.enable = mkIf config.myModules.core.audio.audio.enable true;
    services.pipewire = mkIf config.myModules.core.audio.audio.enable {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
      jack.enable = true;
    };
  };
}
