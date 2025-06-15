{
  pkgs,
  lib,
  config,
  ...
}:
with lib;

{
  options.myModules.thunar.enable = mkEnableOption "Enable Thunar";
  config = mkIf config.myModules.thunar.enable {
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
