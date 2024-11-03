{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    binutils
    brightnessctl
    coreutils
    curl
    gnumake
    libnotify
    lm_sensors
    lshw
    pavucontrol
    pciutils
    playerctl
    unrar
    unzip
    usbutils
    v4l-utils
    wget
    xdg-utils
  ];

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
}
