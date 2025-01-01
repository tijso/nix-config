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
    home.packages = with pkgs; [
      xfce.thunar
      xfce.thunar-archive-plugin
      xfce.thunar-volman
      file-roller
    ];
    programs = {
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
