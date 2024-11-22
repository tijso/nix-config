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
    ./git/lazygit.nix
  ];

  go.enable = true;
  git.enable = true;
  lazygit.enable = true;
  nixdev.enable = true;
}
