{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
{
  options.bat.enable = mkEnableOption "bat settings";

  config = mkIf config.bat.enale {
    home.packages = with pkgs; [
      bat
      bat-extras
    ];
    programs.bat = {
      enable = true;
      catppuccin.enable = true;
      extraPackages = with pkgs.bat-extras; [
        batdiff
        batgrep
        prettybat
        batman
      ];
    };
  };
}
