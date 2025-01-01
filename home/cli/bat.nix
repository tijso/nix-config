{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.modules.cli.bat;
in
{
  options.cli.bat.enable = mkEnableOption "bat settings";
  config = mkIf cfg.enable {
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
