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
        # Module configuration
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

        # Color configuration
        colors = {
          title = "#44FFB1";
          separator = "#24EAF7";
          os = "#0FC5ED";
          host = "#A277FF";
          kernel = "#24EAF7";
          packages = "#FFE073";
          shell = "#E52E2E";
          wm = "#44FFB1";
          memory = "#0FC5ED";
          disk = "#A277FF";
        };

        # ASCII settings
        ascii = {
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
