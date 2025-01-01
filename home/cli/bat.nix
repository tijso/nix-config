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
  options.modules.cli.bat.enable = mkEnableOption "Enable Bat";
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
