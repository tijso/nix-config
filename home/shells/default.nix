{ pkgs, config, ... }:

{
  imports = [
     ./starship.nix
    ./fish.nix
    # ./zsh.nix
  ];
}
