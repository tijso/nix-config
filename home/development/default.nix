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
  ];

  go.enable = true;
  nixdev.enable = true;
}
