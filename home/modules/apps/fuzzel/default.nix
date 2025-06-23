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
          font = mkForce "JetBrains Mono:size=14";
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
        border = {
          radius = 15;
          width = 3;
        };
      };
    };
  };
}
