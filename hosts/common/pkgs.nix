{
  config,
  pkgs,
  ...
}: {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Fix error gtk applications
  programs.dconf.enable = true;

  # Environment system packages
  environment.systemPackages = with pkgs; [
    binutils
    brightnessctl
    coreutils
    curl
    git
    gnumake
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

    # Nix Sutff
    alejandra
    nh
    nil
    nix-du
    nix-prefetch-git
    nix-prefetch-github
  ];

  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      jetbrains-mono
      noto-fonts
      noto-fonts-emoji
      monaspace
      fira-code
      material-icons
      cascadia-code
      (pkgs.nerdfonts.override {
        fonts = [
          "Hack"
          "NerdFontsSymbolsOnly"
        ];
      })
    ];
  };
}
