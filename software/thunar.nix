{
  pkgs,
  lib,
  inputs,
  ...
}: {
  programs = {
    file-roller.enable = true;
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-volman
        thunar-archive-plugin
      ];
    };
  };
}
