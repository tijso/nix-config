{
  pkgs,
  lib,
  ...
}:
with lib;
let
  cfg = config.modules.programs.thunar;
in
{
  options.modules.programs.thunar.enable = mkEnableOption "Enable Thunar";
  config = mkIf cfg.enable {
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
  };
}
