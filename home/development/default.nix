{
  inputs,
  pkgs,
  config,
  ...
}:
{
  imports = [
    ./go.nix
    ./nixdev.nix
    ./git/git.nix
    ./lazygit.nix
  ];

  git.enable = true;
  nixdev.enable = true;
}
