{
  inputs,
  pkgs,
  config,
  ...
}:
{
  imports = [
    ./go.nix
  ];
  go.enable = true;
}
