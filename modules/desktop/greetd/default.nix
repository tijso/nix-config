{
  config,
  pkgs,
  lib,
  ...
}:
with lib; {
  options.myModules.desktop.greetd.enable = mkEnableOption "Enable Greetd";
  config = mkIf config.myModules.desktop.greetd.enable {
    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --remember  --asterisks  --container-padding 2 --no-xsession-wrapper --cmd niri-session";
          user = "greeter";
        };
      };
    };

    systemd = {
      extraConfig = "DefaultTimeoutStopSec=10s";
      services.greetd.serviceConfig = {
        Type = "idle";
        StandardInput = "tty";
        StandardOutput = "tty";
        StandardError = "journal";
        TTYReset = true;
        TTYVHangup = true;
        TTYVTDisallocate = true;
      };
    };
  };
}
