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
  nix.dev = true;
}
