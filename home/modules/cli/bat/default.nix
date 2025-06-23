{
  pkgs,
  lib,
  config,
  ...
}:
with lib;

{
  options.myHome.cli.bat.enable = mkEnableOption "Enable Bat";
  config = mkIf config.myHome.cli.bat.enable {
    programs.bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [
        batdiff
        batgrep
        prettybat
      ];
    };
  };
}
