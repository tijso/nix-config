{ pkgs, ... }:

{
  imports = [
    ./lazygit.nix
    ./git.nix
  ];

  lazygit.enable = true;
  git.enable = true;

}
