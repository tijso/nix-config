{
  config,
  lib,
  ...
}:
with lib;
{
  options.myHome.mako.enable = mkEnableOption "Enable Mako";
  config = mkIf config.myHome.mako.enable {
    services.mako = {
      enable = true;
      backgroundColor = "${config.colorScheme.palette.base00}";
      textColor = "${config.colorScheme.palette.base05}";
      borderColor = "${config.colorScheme.palette.base0D}";
      borderRadius = 12;
      borderSize = 2;
      font = "JetBrains Mono 14";
      padding = "12";
      margin = "12";
      width = 350;
      height = 150;
      defaultTimeout = 5000;
      groupBy = "summary";
    };
  };
}
