{
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.modules.cli.fastfetch;
in
{
  options.modules.cli.fastfetch = {
    enable = mkEnableOption "fastfetch";
  };

  config = mkIf cfg.enable {
    programs.fastfetch = {
      enable = true;
      settings = {
        display = {
          separator = " => ";
          key_width = 15;
          color_keys = "#24EAF7"; # Cyan for keys
          color_title = "#44FFB1"; # Green for title
        };

        modules = [
          "title"
          "separator"
          "os"
          "host"
          "kernel"
          "uptime"
          "packages"
          "shell"
          "display"
          "de"
          "wm"
          "theme"
          "icons"
          "font"
          "cursor"
          "terminal"
          "cpu"
          "gpu"
          "memory"
          "disk"
          "battery"
          "break"
          "colors"
        ];

        format = {
          title = {
            color = "#44FFB1";
          };
          os = {
            color = "#0FC5ED";
          };
          host = {
            color = "#A277FF";
          };
          kernel = {
            color = "#24EAF7";
          };
          packages = {
            color = "#FFE073";
          };
          shell = {
            color = "#E52E2E";
          };
          wm = {
            color = "#44FFB1";
          };
          memory = {
            color = "#0FC5ED";
          };
          disk = {
            color = "#A277FF";
          };
        };

        logo = {
          type = "small";
          colors = [
            "#24EAF7"
            "#44FFB1"
            "#A277FF"
            "#FFE073"
            "#0FC5ED"
            "#E52E2E"
          ];
        };
      };
    };
  };
}
