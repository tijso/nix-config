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

  go.enable = true;
  git.enable = true;
  nixdev.enable = true;
}
