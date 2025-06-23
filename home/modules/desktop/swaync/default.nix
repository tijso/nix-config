{
  pkgs,
  config,
  lib,
  ...
}:
with lib;

{
  options.myHome.desktop.swaync.enable = mkEnableOption "Enable SwayNC";

  config = mkIf config.myHome.desktop.swaync.enable {
    home.packages = with pkgs; [
      swaynotificationcenter
    ];

    # SwayNC configuration
    xdg.configFile."swaync/config.json".text = builtins.toJSON {
      "$schema" = "https://github.com/ErikReider/SwayNotificationCenter/raw/main/src/configSchema.json";

      positionX = "right";
      positionY = "top";
      layer = "overlay";
      control-center-layer = "top";
      layer-shell = true;
      cssPriority = "application";
      control-center-margin-top = 0;
      control-center-margin-bottom = 0;
      control-center-margin-right = 0;
      control-center-margin-left = 0;
      notification-2fa-command = true;
      notification-inline-replies = false;
      notification-icon-size = 64;
      notification-body-image-height = 100;
      notification-body-image-width = 200;
      timeout = 10;
      timeout-low = 5;
      timeout-critical = 0;
      fit-to-screen = true;
      relative-timestamps = true;
      control-center-width = 500;
      control-center-height = 600;
      notification-window-width = 500;
      keyboard-shortcuts = true;
      image-visibility = "when-available";
      transition-time = 200;
      hide-on-clear = false;
      hide-on-action = true;
      script-fail-notify = true;
      scripts = {
        example-script = {
          exec = "echo 'Do something...'";
          urgency = "Normal";
        };
      };
      notification-visibility = {
        example-name = {
          state = "muted";
          urgency = "Low";
          category = "example-category";
        };
      };
      widgets = [
        "inhibitors"
        "title"
        "dnd"
        "notifications"
      ];
      widget-config = {
        inhibitors = {
          text = "Inhibitors";
          button-text = "Clear All";
          clear-all-button = true;
        };
        title = {
          text = "Notifications";
          clear-all-button = true;
          button-text = "Clear All";
        };
        dnd = {
          text = "Do Not Disturb";
        };
        label = {
          max-lines = 5;
          text = "Label Text";
        };
        mpris = {
          image-size = 96;
          image-radius = 12;
        };
      };
    };

    xdg.configFile."swaync/style.css".text = ''
      /* Reset */
      * {
        font-family: "JetBrains Mono Nerd Font", "JetBrains Mono", monospace;
        font-weight: bolder;
      }

      /* Notification window */
      .notification-row {
        outline: none;
        margin: 0;
        padding: 0;
      }

      .notification-row:focus,
      .notification-row:hover {
        background: alpha(#${config.lib.stylix.colors.base08}, 0.1);
      }

      .notification {
        background: transparent;
        padding: 0;
        margin: 0px 8px 8px 0px;
        border-radius: 12px;
        border: 1px solid #${config.lib.stylix.colors.base03};
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
      }

      .notification-content {
        background: #${config.lib.stylix.colors.base00};
        padding: 16px;
        border-radius: 12px;
        border: none;
        color: #${config.lib.stylix.colors.base05};
      }

      .close-button {
        background: #${config.lib.stylix.colors.base08};
        color: #${config.lib.stylix.colors.base00};
        text-shadow: none;
        padding: 0;
        border-radius: 50%;
        margin-top: 8px;
        margin-right: 8px;
        box-shadow: none;
        border: none;
        min-width: 20px;
        min-height: 20px;
      }

      .close-button:hover {
        background: #${config.lib.stylix.colors.base08};
        color: #${config.lib.stylix.colors.base07};
      }

      .notification-default-action,
      .notification-action {
        background: transparent;
        color: #${config.lib.stylix.colors.base05};
        margin: 0;
        border: none;
        border-radius: 0;
        box-shadow: none;
        text-shadow: none;
        padding: 0;
      }

      .notification-default-action:hover,
      .notification-action:hover {
        background: alpha(#${config.lib.stylix.colors.base0D}, 0.2);
      }

      .summary {
        font-size: 16px;
        font-weight: bold;
        background: transparent;
        color: #${config.lib.stylix.colors.base0D};
        text-shadow: none;
        margin: 0px;
      }

      .time {
        font-size: 11px;
        font-weight: bold;
        background: transparent;
        color: #${config.lib.stylix.colors.base04};
        text-shadow: none;
        margin-right: 18px;
      }

      .body {
        font-size: 13px;
        font-weight: normal;
        background: transparent;
        color: #${config.lib.stylix.colors.base05};
        text-shadow: none;
        margin: 0px;
      }

      /* Control Center */
      .control-center {
        background: #${config.lib.stylix.colors.base00};
        border: 2px solid #${config.lib.stylix.colors.base03};
        border-radius: 16px;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
        margin: 8px;
      }

      .control-center-list {
        background: transparent;
      }

      .control-center-list-placeholder {
        opacity: 0.5;
        color: #${config.lib.stylix.colors.base04};
        font-size: 18px;
      }

      .floating-notifications {
        background: transparent;
      }

      /* Widgets */
      .widget-title {
        color: #${config.lib.stylix.colors.base05};
        background: #${config.lib.stylix.colors.base01};
        padding: 8px 16px;
        margin: 0px 8px 8px 8px;
        font-size: 16px;
        border-radius: 12px;
      }

      .widget-title > button {
        font-size: 12px;
        color: #${config.lib.stylix.colors.base05};
        text-shadow: none;
        background: #${config.lib.stylix.colors.base08};
        border: none;
        box-shadow: none;
        border-radius: 8px;
        padding: 4px 8px;
      }

      .widget-title > button:hover {
        background: alpha(#${config.lib.stylix.colors.base08}, 0.8);
      }

      .widget-dnd {
        background: #${config.lib.stylix.colors.base01};
        padding: 8px 16px;
        margin: 0px 8px 8px 8px;
        border-radius: 12px;
        font-size: 14px;
        color: #${config.lib.stylix.colors.base05};
      }

      .widget-dnd > switch {
        border-radius: 8px;
        background: #${config.lib.stylix.colors.base03};
      }

      .widget-dnd > switch:checked {
        background: #${config.lib.stylix.colors.base0B};
      }

      .widget-dnd > switch slider {
        background: #${config.lib.stylix.colors.base05};
        border-radius: 8px;
      }

      .widget-inhibitors {
        background: #${config.lib.stylix.colors.base01};
        padding: 8px 16px;
        margin: 0px 8px 8px 8px;
        border-radius: 12px;
        font-size: 14px;
        color: #${config.lib.stylix.colors.base05};
      }

      .widget-inhibitors > button {
        font-size: 12px;
        color: #${config.lib.stylix.colors.base05};
        text-shadow: none;
        background: #${config.lib.stylix.colors.base08};
        border: none;
        box-shadow: none;
        border-radius: 8px;
        padding: 4px 8px;
      }

      .widget-inhibitors > button:hover {
        background: alpha(#${config.lib.stylix.colors.base08}, 0.8);
      }

      /* Urgency levels */
      .low {
        background: alpha(#${config.lib.stylix.colors.base0C}, 0.1);
        border: 1px solid #${config.lib.stylix.colors.base0C};
      }

      .normal {
        background: alpha(#${config.lib.stylix.colors.base0D}, 0.1);
        border: 1px solid #${config.lib.stylix.colors.base0D};
      }

      .critical {
        background: alpha(#${config.lib.stylix.colors.base08}, 0.2);
        border: 1px solid #${config.lib.stylix.colors.base08};
      }

      /* Scrollbar */
      .control-center scrollbar,
      .notification-group scrollbar {
        background: transparent;
      }

      .control-center scrollbar trough,
      .notification-group scrollbar trough {
        background: #${config.lib.stylix.colors.base01};
        border-radius: 8px;
      }

      .control-center scrollbar slider,
      .notification-group scrollbar slider {
        background: #${config.lib.stylix.colors.base04};
        border-radius: 8px;
        min-width: 8px;
        min-height: 8px;
      }

      .control-center scrollbar slider:hover,
      .notification-group scrollbar slider:hover {
        background: #${config.lib.stylix.colors.base05};
      }
    '';
  };
}
