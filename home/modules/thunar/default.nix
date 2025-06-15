{
  pkgs,
  lib,
  config,
  ...
}:
with lib;

{
  options.myHome.thunar.enable = mkEnableOption "Enable Thunar";
  config = mkIf config.myHome.thunar.enable {
    programs = {
      thunar = {
        enable = true;
        plugins = with pkgs.xfce; [
          thunar-volman
          thunar-archive-plugin
        ];
      };
    };
    # home.packages = with pkgs; [
    #   xfce.thunar
    #   xfce.thunar-archive-plugin
    #   xfce.thunar-volman
    #   file-roller
    # ];
  };
}
