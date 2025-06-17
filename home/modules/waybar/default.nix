{
  pkgs,
  config,
  lib,
  ...
}:
with lib;
{
  options.myHome.waybar.enable = mkEnableOption "Enable Waybar";
  config = mkIf config.myHome.waybar.enable {
    programs.waybar = {
      enable = true;
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          height = 35;
          spacing = 8;
          margin-top = 8;
          margin-left = 12;
          margin-right = 12;

          modules-left = [
            "custom/launcher"
            "niri/workspaces"
            "niri/window"
          ];
          modules-center = [ "clock" ];
          modules-right = [
            "pulseaudio"
            "network"
            "battery"
            "custom/power"
          ];

          "custom/launcher" = {
            format = " ";
            on-click = "${pkgs.fuzzel}/bin/fuzzel";
            tooltip = false;
          };

          "niri/workspaces" = {
            format = "{icon}";
            format-icons = {
              active = "";
              default = "";
            };
          };

          "niri/window" = {
            format = "{}";
            max-length = 50;
            rewrite = {
              "(.*) — Mozilla Firefox" = " $1";
              "(.*) - Brave" = " $1";
              "(.*) - Visual Studio Code" = "󰨞 $1";
              "(.*) - Ghostty" = " $1";
            };
          };

          clock = {
            format = "{:%H:%M}";
            format-alt = "{:%A, %B %d, %Y (%R)}";
            tooltip-format = "<tt><small>{calendar}</small></tt>";
          };

          pulseaudio = {
            format = "{icon} {volume}%";
            format-muted = "󰝟 Muted";
            format-icons = {
              default = [
                "󰕿"
                "󰖀"
                "󰕾"
              ];
            };
            on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
            scroll-step = 5;
          };

          network = {
            format-wifi = "󰤨 {signalStrength}%";
            format-ethernet = "󰈀 Connected";
            format-disconnected = "󰤭 Disconnected";
            tooltip-format = "{ifname}: {ipaddr}";
          };

          battery = {
            format = "{icon} {capacity}%";
            format-icons = [
              "󰁺"
              "󰁻"
              "󰁼"
              "󰁽"
              "󰁾"
              "󰁿"
              "󰂀"
              "󰂁"
              "󰂂"
              "󰁹"
            ];
            format-charging = "󰂄 {capacity}%";
            states = {
              warning = 30;
              critical = 15;
            };
          };

          "custom/power" = {
            format = "⏻";
            on-click = "${pkgs.wlogout}/bin/wlogout";
            tooltip = false;
          };
        };
      };

      style = ''
        * {
          font-family: "JetBrains Mono", monospace;
          font-size: 13px;
          border: none;
          border-radius: 0;
          min-height: 0;
        }

        window#waybar {
          background: alpha(${colors.base00}, 0.9);
          border: 2px solid ${colors.base0D};
          border-radius: 12px;
          color: ${colors.base05};
        }

        #workspaces button {
          padding: 0 8px;
          background: transparent;
          color: ${colors.base04};
          border-radius: 8px;
          margin: 2px;
        }

        #workspaces button.active {
          background: ${colors.base0D};
          color: ${colors.base00};
        }

        #workspaces button:hover {
          background: alpha(${colors.base0D}, 0.3);
          color: ${colors.base05};
        }

        #custom-launcher {
          padding: 0 12px;
          color: ${colors.base0D};
          font-size: 16px;
        }

        #window {
          color: ${colors.base05};
          font-weight: bold;
        }

        #clock {
          padding: 0 12px;
          color: ${colors.base0A};
          font-weight: bold;
        }

        #pulseaudio, #network, #battery {
          padding: 0 8px;
          color: ${colors.base05};
        }

        #battery.warning {
          color: ${colors.base0A};
        }

        #battery.critical {
          color: ${colors.base08};
        }

        #custom-power {
          padding: 0 12px;
          color: ${colors.base08};
          font-size: 16px;
        }
      '';
    };
  };
}
