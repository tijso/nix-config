{
  pkgs,
  config,
  lib,
  ...
}:
with lib; {
  options.myModules.core.pkgs.enable = mkEnableOption "Enable Packages";

  config = mkIf config.myModules.core.pkgs.enable {
    environment.systemPackages = with pkgs; [
      bibata-cursors
      binutils
      brave
      brightnessctl
      cachix
      corefonts
      coreutils
      curl
      dconf
      git
      gnumake
      gsettings-desktop-schemas
      gtk-engine-murrine
      gtk_engines
      gparted
      killall
      libnotify
      lm_sensors
      lshw
      mpd
      pavucontrol
      pciutils
      playerctl
      unrar
      unzip
      usbutils
      v4l-utils
      vim
      wget
      xdg-utils
      zip
    ];
  };
}
