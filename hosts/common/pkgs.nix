{
  pkgs,
  ...
}:
{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Environment system packages
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
    deckmaster
    # papirus-icon-theme
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
      maple-mono
      monaspace
      fira-code
      material-icons
      cascadia-code
      nerd-fonts.hack
      nerd-fonts.symbols-only
    ];
  };
}
