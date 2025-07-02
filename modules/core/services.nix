{
  pkgs,
  config,
  lib,
  ...
}:
with lib; {
  options.myModules.core.services.enable = mkEnableOption "Enable Services";
  config = mkIf config.myModules.core.services.enable {
    programs = {
      # ssh.startAgent = true;
      dconf.enable = true;
    };

    services = {
      avahi.enable = true;
      blueman.enable = true;
      dbus.enable = true;
      envfs.enable = true;
      gnome.gnome-keyring.enable = true;
      # gvfs.enable = true;
      libinput.enable = true;
      nfs.server.enable = true;
      # power-profiles-daemon.enable = true; # Use With Laptops
      rpcbind.enable = true;
      tumbler.enable = true;
      udev.enable = true;
      udisks2.enable = true;
      # upower.enable = true; # laptops/battery info

      openssh = {
        enable = true;
        settings = {
          PermitRootLogin = "no"; # Prevent root from SSH login
          PasswordAuthentication = true; # Users can SSH using kb and password
          KbdInteractiveAuthentication = true;
        };
        ports = [22];
      };

      pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        wireplumber.enable = true;
        jack.enable = true;
      };

      journald = {
        extraConfig = ''
          SystemMaxUse=100M
          SystemKeepFree=1G
          SystemMaxFileSize=50M
          RuntimeMaxUse=100M

          Storage=persistent
          Compress=yes
          SyncIntervalSec=5m

          MaxRetentionSec=1month
          MaxFileSec=1week
        '';
      };

      xserver = {
        xkb = {
          layout = "us";
          # variant = "colemak_dh"
        };
      };

      unclutter = {
        enable = true;
        timeout = 3;
        threshold = 10;
        extraOptions = [
          "exclude-root"
          "ignore-scrolling"
        ];
      };

      smartd = {
        enable = true;
        autodetect = true;
      };

      fstrim = {
        enable = true;
        interval = "weekly";
      };

      printing = {
        enable = false;
        drivers = [
          pkgs.hplipWithPlugin
        ];
      };
    };
  };
}
