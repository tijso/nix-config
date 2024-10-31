{
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./amd.nix
    ./bluetooth.nix
  ];
}
