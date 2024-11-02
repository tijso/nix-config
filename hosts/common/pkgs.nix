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
    git
    vim
    wget
    killall
    nh
    nix-du
    nix-prefetch-git
    nix-prefetch-github
    alejandra
    nil
    mpd
    curl
    unzip
    zip
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



}
