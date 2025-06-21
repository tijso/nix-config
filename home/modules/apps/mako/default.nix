{
  config,
  lib,
  ...
}:
with lib;
{
  options.myHome.apps.mako.enable = mkEnableOption "Enable Mako";
  config = mkIf config.myHome.apps.mako.enable {
    services.mako = {
      enable = true;
      settings = {
        background-color = "#${config.colorScheme.palette.base00}";
        text-color = "#${config.colorScheme.palette.base05}";
        border-color = "#${config.colorScheme.palette.base0D}";
        border-radius = 12;
        border-size = 2;
        font = "JetBrains Mono 14";
        padding = "12";
        margin = "12";
        width = 350;
        height = 150;
        default-timeout = 5000;
        group-by = "summary";
      };
    };
  };
}
