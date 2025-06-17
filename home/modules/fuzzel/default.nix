{
  pkgs,
  config,
  lib,
  ...
}:
with lib;
{
  home.packages = with pkgs; [
    fuzzel
  ];

  options.myHome.fuzzel.enable = mkEnableOption "Enable Fuzzel";

  config = mkIf config.myHome.fuzzel.enable {
    programs.fuzzel = {
      enable = true;
      settings = {
        main = {
          font = "JetBrains Mono:size=12";
          dpi-aware = "yes";
          show-actions = "yes";
          width = 50;
          horizontal-pad = 20;
          vertical-pad = 10;
          inner-pad = 10;
        };
        colors = {
          background = "${colors.base00}dd";
          text = "${colors.base05}ff";
          match = "${colors.base0D}ff";
          selection = "${colors.base02}ff";
          selection-text = "${colors.base05}ff";
          selection-match = "${colors.base0D}ff";
          border = "${colors.base0D}ff";
        };
        border = {
          width = 2;
          radius = 12;
        };
      };
    };
  };
}
