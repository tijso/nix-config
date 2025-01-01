{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.modules.programs.thunar;
in
{
  options.modules.programs.thunar.enable = mkEnableOption "Enable Thunar";
  config = mkIf cfg.enable {
    programs.xfce = {
      thunar = {
        enable = true;
        plugins = with pkgs.xfce; [
          thunar-volman
          thunar-archive-plugin
          file-roller
        ];
      };
    };
  };
}
