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
  options.modules.cli.fastfetch.enable = mkEnableOption "Enable Fastfetch";
  config = mkIf cfg.enable {
    programs.fastfetch = {
      enable = true;

      settings = {
        display = {
          color = {
            keys = "35";
            output = "90";
          };
        };

        logo = {
          source = ./nixos.png;
          type = "kitty-direct";
          height = 15;
          width = 30;
          padding = {
            top = 3;
            left = 3;
          };
        };

        modules = [
          "break"
          {
            type = "custom";
            format = "┌────────────────────────────────────────────────────┐";
          }
          "break"
          {
            # type = "custom";
            # format = " OS -> ";
            key = "│  OS";
            keyColor = "green";
            type = "os";
          }
          {
            key = "│ 󰌢 Machine";
            keyColor = "cyan";
            type = "host";
          }
          {
            key = "│  Kernel";
            keyColor = "blue";
            type = "kernel";
          }
          {
            key = "│  Uptime";
            keyColor = "green";
            type = "uptime";
          }
          {
            key = "│ 󰏖 Packages";
            keyColor = "cyan";
            type = "packages";
          }
          {
            key = "│   WM";
            keyColor = "blue";
            type = "wm";
          }
          {
            key = "│ 󰉼 Theme";
            keyColor = "cyan";
            type = "wmtheme";
          }
          {
            key = "│  Shell";
            keyColor = "green";
            type = "shell";
          }
          {
            key = "│  Terminal";
            keyColor = "cyan";
            type = "terminal";
          }
          {
            key = "│  Font  ";
            keyColor = "blue";
            type = "terminalfont";
          }
          {
            key = "│  CPU";
            keyColor = "green";
            type = "cpu";
          }
          {
            key = "│ 󰍛 GPU";
            keyColor = "cyan";
            type = "gpu";
          }
          {
            key = "│ 󰑭 Memory";
            keyColor = "blue";
            type = "memory";
          }
          "break"
          {
            type = "custom";
            format = "└────────────────────────────────────────────────────┘";
          }
          "break"
        ];
      };
    };
  };
}
