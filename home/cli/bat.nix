{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
{
  options.bat.enable = mkEnableOption "bat settings";
  config = mkIf config.bat.enable {
    programs.bat = {
      enable = true;
      catppuccin.enable = true;
      extraPackages = with pkgs.bat-extras; [
        batdiff
        batgrep
        prettybat
      ];
    };
  };
}
