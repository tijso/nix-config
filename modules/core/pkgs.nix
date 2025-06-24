{
  pkgs,
  config,
  lib,
  ...
}:
with lib;
{

  options.myModules.core.pkgs.enable = mkEnableOption "Enable Packages";

  config = mkIf config.myModules.core.pkgs.enable {
    environment.systemPackages = with pkgs; [
      bibata-cursors
      binutils
      brave
      brightnessctl
      coreutils
      curl
      dconf
      git
      gnumake
      gtk-engine-murrine
      gtk_engines
      gsettings-desktop-schemas
      gnome-settings-daemon
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

    fonts = {
      fontDir.enable = true;
      packages = with pkgs; [
        jetbrains-mono
        noto-fonts
        noto-fonts-emoji
        maple-mono.NF
        monaspace
        fira-code
        iosevka
        material-icons
        cascadia-code
        nerd-fonts.jetbrains-mono
        nerd-fonts.hack
        nerd-fonts.symbols-only
      ];
    };
  };
}
