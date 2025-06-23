{
  pkgs,
  config,
  lib,
  ...
}:
with lib;

let
  betterTransition = "all 0.3s cubic-bezier(.55,-0.68,.48,1.682)";
in
{
  options.myHome.desktop.waybar.enable = mkEnableOption "Enable Waybar";
  config = mkIf config.myHome.desktop.waybar.enable {
    programs.waybar = {
      enable = true;
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          height = 40;
          spacing = 0;
          margin-top = 4;
          margin-left = 8;
          margin-right = 8;

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
            format = "";
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
              "" = " 🙈 No Windows? ";
            };
          };

          clock = {
            format = "{:%H:%M}";
            format-alt = "{:%A, %B %d, %Y (%R)}";
            tooltip-format = "<big>{:%A, %d %B %Y}</big>\n<tt><small>{calendar}</small></tt>";
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
              headphone = "";
              headset = "";
            };
            on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
            scroll-step = 5;
            tooltip = true;
          };

          network = {
            format-wifi = "󰤨 {signalStrength}%";
            format-ethernet = "󰈀 Connected";
            format-disconnected = "󰤭 Disconnected";
            tooltip-format = "{ifname}: {ipaddr}";
            format-icons = [
              "󰤯"
              "󰤟"
              "󰤢"
              "󰤥"
              "󰤨"
            ];
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
            format-plugged = "󱘖 {capacity}%";
            states = {
              warning = 30;
              critical = 15;
            };
            tooltip = true;
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
          font-family: "JetBrains Mono Nerd Font", "JetBrains Mono", monospace;
          font-size: 14px;
          border: none;
          border-radius: 0;
          min-height: 0;
        }

        window#waybar {
          background: rgba(0, 0, 0, 0);
        }

        tooltip {
          background: #${config.lib.stylix.colors.base00};
          border: 1px solid #${config.lib.stylix.colors.base08};
          border-radius: 12px;
          color: #${config.lib.stylix.colors.base05};
        }

        tooltip label {
          color: #${config.lib.stylix.colors.base05};
        }

        #workspaces {
          color: #${config.lib.stylix.colors.base00};
          background: #${config.lib.stylix.colors.base01};
          margin: 4px 4px;
          padding: 5px 5px;
          border-radius: 16px;
        }

        #workspaces button {
          font-weight: bold;
          padding: 0px 8px;
          margin: 0px 3px;
          border-radius: 16px;
          color: #${config.lib.stylix.colors.base00};
          background: linear-gradient(45deg, #${config.lib.stylix.colors.base08}, #${config.lib.stylix.colors.base0D});
          opacity: 0.5;
          transition: ${betterTransition};
          min-width: 30px;
        }

        #workspaces button.active {
          font-weight: bold;
          padding: 0px 8px;
          margin: 0px 3px;
          border-radius: 16px;
          color: #${config.lib.stylix.colors.base00};
          background: linear-gradient(45deg, #${config.lib.stylix.colors.base08}, #${config.lib.stylix.colors.base0D});
          transition: ${betterTransition};
          opacity: 1.0;
          min-width: 40px;
        }

        #workspaces button:hover {
          font-weight: bold;
          border-radius: 16px;
          color: #${config.lib.stylix.colors.base00};
          background: linear-gradient(45deg, #${config.lib.stylix.colors.base08}, #${config.lib.stylix.colors.base0D});
          opacity: 0.8;
          transition: ${betterTransition};
        }

        #custom-launcher {
          color: #${config.lib.stylix.colors.base0B};
          background: #${config.lib.stylix.colors.base02};
          font-size: 20px;
          font-weight: bold;
          margin: 4px 0px;
          margin-left: 0px;
          padding: 0px 20px 0px 15px;
          border-radius: 0px 0px 24px 0px;
        }

        #window {
          font-weight: bold;
          margin: 4px 0px;
          margin-left: 7px;
          padding: 0px 18px;
          background: #${config.lib.stylix.colors.base04};
          color: #${config.lib.stylix.colors.base00};
          border-radius: 24px 10px 24px 10px;
        }

        #clock {
          font-weight: bold;
          font-size: 15px;
          color: #${config.lib.stylix.colors.base00};
          background: linear-gradient(90deg, #${config.lib.stylix.colors.base0E}, #${config.lib.stylix.colors.base0C});
          margin: 4px 0px;
          padding: 0px 20px;
          border-radius: 16px;
        }

        #pulseaudio, #network, #battery {
          font-weight: bold;
          background: #${config.lib.stylix.colors.base0F};
          color: #${config.lib.stylix.colors.base00};
          margin: 4px 0px;
          margin-right: 7px;
          border-radius: 10px 24px 10px 24px;
          padding: 0px 16px;
          transition: ${betterTransition};
        }

        #pulseaudio:hover, #network:hover, #battery:hover {
          background: alpha(#${config.lib.stylix.colors.base0F}, 0.8);
          transition: ${betterTransition};
        }

        #battery.warning {
          background: #${config.lib.stylix.colors.base0A};
          color: #${config.lib.stylix.colors.base00};
        }

        #battery.critical {
          background: #${config.lib.stylix.colors.base08};
          color: #${config.lib.stylix.colors.base07};
          animation: blink 0.5s linear infinite alternate;
        }

        @keyframes blink {
          to {
            background: alpha(#${config.lib.stylix.colors.base08}, 0.5);
          }
        }

        #custom-power {
          color: #${config.lib.stylix.colors.base08};
          background: #${config.lib.stylix.colors.base02};
          font-size: 18px;
          font-weight: bold;
          margin: 4px 0px;
          margin-right: 0px;
          padding: 0px 15px 0px 20px;
          border-radius: 0px 0px 0px 24px;
          transition: ${betterTransition};
        }

        #custom-power:hover {
          background: alpha(#${config.lib.stylix.colors.base08}, 0.2);
          color: #${config.lib.stylix.colors.base08};
          transition: ${betterTransition};
        }
      '';
    };
  };
}
