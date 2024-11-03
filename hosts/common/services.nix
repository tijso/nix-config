{pkgs, ...}: {
  services.libinput.enable = true;
  programs.dconf.enable = true;
  services = {
    dbus.enable = true;
    gvfs.enable = true;
    upower.enable = true;
    power-profiles-daemon.enable = true;
    udisks2.enable = true;
    tumbler.enable = true;
    fstrim.enable = true;
    printing.drivers = [pkgs.hplip];
    printing.enable = true;
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };

  services.xserver.enable = true;
  services.xserver.excludePackages = [pkgs.xterm]; # i don't want xterm :(
}
