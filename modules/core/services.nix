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
      ssh.startAgent = true;
      dconf.enable = true;
    };

    services = {
      avahi.enable = true;
      blueman.enable = true;
      dbus.enable = true;
      envfs.enable = true;
      gnome.gnome-keyring.enable = true;
      gvfs.enable = true;
      libinput.enable = true;
      nfs.server.enable = true;
      openssh.enable = true;
      # power-profiles-daemon.enable = true; # Use With Laptops
      rpcbind.enable = true;
      tumbler.enable = true;
      udev.enable = true;
      udisks2.enable = true;
      # upower.enable = true; # laptops/battery info

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
