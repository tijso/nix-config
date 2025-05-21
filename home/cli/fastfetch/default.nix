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
            format = "┌────────────────────────────────────────────┐";
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
            key = "│ ├ Kernel";
            keyColor = "blue";
            type = "kernel";
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
          {
            type = "custom";
            format = "└────────────────────────────────────────────────────┘";
          }
          "break"
          {
            type = "custom";
            format = "┌──────────────────────Software──────────────────────┐";
          }
          {
            type = "packages";
            key = "│ ├󰏖 ";
            keyColor = "cyan";
          }
          {
            type = "shell";
            key = "└ └ ";
            keyColor = "green";
          }
          "break"
          {
            type = "wm";
            key = " WM";
            keyColor = "blue";
          }
          {
            type = "wmtheme";
            key = "│ ├󰉼 ";
            keyColor = "green";
          }
          {
            type = "terminal";
            key = "└ └ ";
            keyColor = "cyan";
          }
          {
            type = "custom";
            format = "└────────────────────────────────────────────────────┘";
          }
          "break"
          {
            type = "custom";
            format = "┌────────────────────Uptime / Age────────────────────┐";
          }
          {
            type = "command";
            key = "│  ";
            text =
              #bash
              ''
                birth_install=$(stat -c %W /)
                current=$(date +%s)
                delta=$((current - birth_install))
                delta_days=$((delta / 86400))
                echo $delta_days days
              '';
          }
          {
            type = "uptime";
            key = "│  ";
            keyColor = "green";
          }
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
