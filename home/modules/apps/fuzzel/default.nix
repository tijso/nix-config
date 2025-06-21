{
  config,
  lib,
  ...
}:
with lib;
{
  options.myHome.apps.fuzzel.enable = mkEnableOption "Enable Fuzzel";
  config = mkIf config.myHome.apps.fuzzel.enable {
    programs.fuzzel = {
      enable = true;
      settings = {
        main = {
          font = "JetBrains Mono:size=14";
          line-height = 25;
          fields = "name,generic,comment,categories,filename,keywords";
          terminal = "ghostty";
          prompt = "' ➜  '";
          icon-theme = "Fluent-teal-dark";
          layer = "top";
          lines = 10;
          width = 35;
          horizontal-pad = 25;
          inner-pad = 5;
        };
        colors = {
          background = "${config.colorScheme.palette.base00}dd";
          text = "${config.colorScheme.palette.base05}ff";
          match = "${config.colorScheme.palette.base0D}ff";
          selection = "${config.colorScheme.palette.base02}ff";
          selection-text = "${config.colorScheme.palette.base05}ff";
          selection-match = "${config.colorScheme.palette.base0D}ff";
          border = "${config.colorScheme.palette.base0D}ff";
        };
        border = {
          radius = 15;
          width = 3;
        };
      };
    };
  };
}
