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
      # Move settings into configFile for proper structure
      configFile = {
        # Display config
        display = {
          separator = " => ";
          key_width = 15; # Changed from keyWidth to key_width
          # Using your color scheme
          color_keys = "#24EAF7"; # Cyan for keys
          color_title = "#44FFB1"; # Green for title
        };

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

        # Color configuration for each module
        format = {
          title = {
            color = "#44FFB1"; # Green for title text
          };
          os = {
            color = "#0FC5ED"; # Light blue for OS info
          };
          host = {
            color = "#A277FF"; # Purple for host info
          };
          kernel = {
            color = "#24EAF7"; # Cyan for kernel info
          };
          packages = {
            color = "#FFE073"; # Yellow for package info
          };
          shell = {
            color = "#E52E2E"; # Red for shell info
          };
          wm = {
            color = "#44FFB1"; # Green for WM info
          };
          memory = {
            color = "#0FC5ED"; # Light blue for memory info
          };
          disk = {
            color = "#A277FF"; # Purple for disk info
          };
        };

        # Logo configuration
        logo = {
          type = "small"; # You can change this to "large" if preferred
          colors = [
            # Changed from color to colors and made it a list
            "#24EAF7" # Cyan
            "#44FFB1" # Green
            "#A277FF" # Purple
            "#FFE073" # Yellow
            "#0FC5ED" # Light blue
            "#E52E2E" # Red
          ];
        };
      };
    };
  };
}
