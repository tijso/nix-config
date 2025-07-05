{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.myModules.core.security.enable = mkEnableOption "Enable Security";

  config = mkIf config.myModules.core.security.enable {
    services.pcscd.enable = true;
    programs.seahorse.enable = true;

    security = {
      rtkit.enable = true;
      forcePageTableIsolation = true;
      apparmor = {
        enable = true;
        killUnconfinedConfinables = true;
      };
      polkit = {
        enable = true;
        extraConfig = ''
          polkit.addRule(function(action, subject) {
            if (
              subject.isInGroup("users")
                && (
                  action.id == "org.freedesktop.login1.reboot" ||
                  action.id == "org.freedesktop.login1.reboot-multiple-sessions" ||
                  action.id == "org.freedesktop.login1.power-off" ||
                  action.id == "org.freedesktop.login1.power-off-multiple-sessions"
                )
              )
            {
              return polkit.Result.YES;
            }
          })
        '';
      };
      pam.services.swaylock = {
        text = ''
          auth include login
        '';
      };
    };
  };
}
