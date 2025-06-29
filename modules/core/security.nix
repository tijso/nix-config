{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
{
  options.myModules.core.security.enable = mkEnableOption "Enable Security";

  config = mkIf config.myModules.core.security.enable {
    environment.systemPackages = with pkgs; [
      polkit_gnome
    ];

    # Enable Yubikey support
    services.pcscd.enable = true;
    programs.seahorse.enable = true;

    security = {
      polkit.enable = true;
      forcePageTableIsolation = true;
      apparmor = {
        enable = true;
        killUnconfinedConfinables = true;
      };
    };

    security.polkit.extraConfig = ''
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

    systemd.user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };
}
