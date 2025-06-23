{
  pkgs,
  config,
  lib,
  ...
}:
with lib;
{
  options.myModules.core.services.enable = mkEnableOption "Enable Services";

  config = mkIf config.myModules.core.services.enable {
    services.avahi.enable = true;
    services.fstrim.enable = true;
    services.gvfs.enable = true;

    services.dbus.enable = true;
    services.gnome.gnome-keyring.enable = true;

    services.libinput.enable = true;
    services.libinput.touchpad.tapping = true;

    services.power-profiles-daemon.enable = true;
    services.upower.enable = true;

    services.printing.drivers = [ pkgs.hplip ];
    services.printing.enable = true;

    services.tumbler.enable = true;
    services.udisks2.enable = true;

    services.xserver.enable = true;
    services.xserver.excludePackages = [ pkgs.xterm ];

    services.openssh.enable = true;
    # programs.ssh.startAgent = false;
    programs.dconf.enable = true;
  };

  services.unclutter = {
    enable = true;
    timeout = 1; # Hide cursor after 1 second of inactivity
    extraOptions = [
      "exclude-root"
      "ignore-scrolling"
    ];
  };
}
