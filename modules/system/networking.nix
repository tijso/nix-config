{ inputs, pkgs, ... }:

{
  networking = {
    hostName = "serenity";
    networkmanager.enable = true;
  };
}
