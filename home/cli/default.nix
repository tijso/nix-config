{
  pkgs,
  ...
}:
{
  imports = [
    ./bat.nix
    ./eza.nix
    ./fastfetch
    ./fish.nix
    ./git.nix
    ./starship.nix
    # ./zsh.nix
  ];

  home.packages = with pkgs; [
    btop
    fd
    ripgrep
    duf
    tldr
    tree
    qbittorrent
  ];
}
