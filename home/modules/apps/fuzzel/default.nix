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
          background = "${config.lib.stylix.colors.base00}dd";
          text = "${config.lib.stylix.colors.base05}ff";
          match = "${config.lib.stylix.colors.base0D}ff";
          selection = "${config.lib.stylix.colors.base02}ff";
          selection-text = "${config.lib.stylix.colors.base05}ff";
          selection-match = "${config.lib.stylix.colors.base0D}ff";
          border = "${config.lib.stylix.colors.base0D}ff";
        };

        border = {
          radius = 15;
          width = 3;
        };
      };
    };
  };
}
