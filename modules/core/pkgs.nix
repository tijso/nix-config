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
      binutils
      brave
      brightnessctl
      cachix
      cifs-utils
      git
      gnumake
      gsettings-desktop-schemas
      gparted
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
      vial
      vim
      xdg-utils
      zip
    ];
  };
}
