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
    services.swaync = {
      enable = true;
      settings = {
        "$schema" = "https://github.com/ErikReider/SwayNotificationCenter/raw/main/src/configSchema.json";
        positionX = "right";
        positionY = "top";
        layer = "overlay";
        control-center-layer = "top";
        layer-shell = true;
        cssPriority = "application";

        control-center-margin-top = 10;
        control-center-margin-bottom = 10;
        control-center-margin-right = 10;
        control-center-margin-left = 10;

        notification-2fa-command = true;
        notification-inline-replies = false;
        notification-icon-size = 64;
        notification-body-image-height = 100;
        notification-body-image-width = 200;

        timeout = 10;
        timeout-low = 5;
        timeout-critical = 0;

        fit-to-screen = false;
        relative-timestamps = true;
        control-center-width = 500;
        control-center-height = 1025;
        notification-window-width = 500;
        keyboard-shortcuts = true;
        image-visibility = "when-available";
        transition-time = 200;
        hide-on-clear = false;
        hide-on-action = true;
        script-fail-notify = true;

        scripts = {
          example-script = {
            exec = "echo 'Custom action executed'";
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

        widget-config = {
          title = {
            text = "Notification Center";
            clear-all-button = true;
            button-text = "󰆴 Clear All";
          };
          dnd = {
            text = "Do Not Disturb";
          };
          label = {
            max-lines = 1;
            text = "Notification Center";
          };
          mpris = {
            image-size = 96;
            image-radius = 7;
          };
          volume = {
            label = "󰕾";
            show-per-app = true;
          };
          backlight = {
            label = "󰃟";
          };
          inhibitors = {
            text = "Inhibitors";
            button-text = "Clear All";
            clear-all-button = true;
          };
        };

        widgets = [
          "title"
          "mpris"
          "volume"
          "backlight"
          "dnd"
          "inhibitors"
          "notifications"
        ];
      };

      style = ''
        * {
          font-family: "JetBrains Mono Nerd Font", "JetBrains Mono", monospace;
          font-weight: bold;
        }

        /* Notification rows */
        .control-center .notification-row:focus,
        .control-center .notification-row:hover {
          opacity: 0.9;
          background: #${config.lib.stylix.colors.base00};
          transition: all 0.15s ease-in-out;
        }

        .notification-row {
          outline: none;
          margin: 10px;
          padding: 0;
        }

        .notification {
          background: transparent;
          padding: 0;
          margin: 0px;
        }

        .notification-content {
          background: #${config.lib.stylix.colors.base00};
          padding: 12px;
          border-radius: 12px;
          border: 2px solid #${config.lib.stylix.colors.base0D};
          margin: 0;
          box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .notification-default-action {
          margin: 0;
          padding: 0;
          border-radius: 12px;
          background: transparent;
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
          min-width: 24px;
          min-height: 24px;
        }

        .close-button:hover {
          background: #${config.lib.stylix.colors.base0D};
          color: #${config.lib.stylix.colors.base00};
          transition: all 0.15s ease-in-out;
        }

        .notification-action {
          border: 2px solid #${config.lib.stylix.colors.base0D};
          border-top: none;
          border-radius: 0px 0px 12px 12px;
          background: #${config.lib.stylix.colors.base00};
          color: #${config.lib.stylix.colors.base05};
        }

        .notification-default-action:hover,
        .notification-action:hover {
          background: alpha(#${config.lib.stylix.colors.base0D}, 0.2);
          transition: all 0.15s ease-in-out;
        }

        .notification-action:first-child {
          border-bottom-left-radius: 12px;
        }

        .notification-action:last-child {
          border-bottom-right-radius: 12px;
        }

        /* Inline replies */
        .inline-reply {
          margin-top: 8px;
        }

        .inline-reply-entry {
          background: #${config.lib.stylix.colors.base01};
          color: #${config.lib.stylix.colors.base05};
          caret-color: #${config.lib.stylix.colors.base0D};
          border: 1px solid #${config.lib.stylix.colors.base03};
          border-radius: 8px;
          padding: 8px;
        }

        .inline-reply-button {
          margin-left: 8px;
          background: #${config.lib.stylix.colors.base0D};
          border: none;
          border-radius: 8px;
          color: #${config.lib.stylix.colors.base00};
          padding: 8px 12px;
        }

        .inline-reply-button:hover {
          background: alpha(#${config.lib.stylix.colors.base0D}, 0.8);
        }

        .inline-reply-button:disabled {
          background: #${config.lib.stylix.colors.base03};
          color: #${config.lib.stylix.colors.base04};
        }

        /* Body image */
        .body-image {
          margin-top: 8px;
          background-color: #${config.lib.stylix.colors.base01};
          border-radius: 8px;
        }

        /* Text elements */
        .summary {
          font-size: 16px;
          font-weight: 700;
          background: transparent;
          color: #${config.lib.stylix.colors.base0B};
          text-shadow: none;
        }

        .time {
          font-size: 12px;
          font-weight: 600;
          background: transparent;
          color: #${config.lib.stylix.colors.base04};
          text-shadow: none;
          margin-right: 18px;
        }

        .body {
          font-size: 14px;
          font-weight: 400;
          background: transparent;
          color: #${config.lib.stylix.colors.base05};
          text-shadow: none;
        }

        /* Control center */
        .control-center {
          background: #${config.lib.stylix.colors.base00};
          border: 2px solid #${config.lib.stylix.colors.base03};
          border-radius: 16px;
          box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
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

        .blank-window {
          background: alpha(black, 0);
        }

        /* Widgets */
        .widget-title {
          color: #${config.lib.stylix.colors.base0B};
          background: #${config.lib.stylix.colors.base01};
          padding: 8px 16px;
          margin: 12px 12px 8px 12px;
          font-size: 1.5rem;
          border-radius: 12px;
        }

        .widget-title > button {
          font-size: 1rem;
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
          transition: all 0.15s ease-in-out;
        }

        .widget-dnd {
          background: #${config.lib.stylix.colors.base01};
          padding: 8px 16px;
          margin: 12px 12px 8px 12px;
          border-radius: 12px;
          font-size: large;
          color: #${config.lib.stylix.colors.base0B};
        }

        .widget-dnd > switch {
          border-radius: 16px;
          background: #${config.lib.stylix.colors.base03};
        }

        .widget-dnd > switch:checked {
          background: #${config.lib.stylix.colors.base08};
        }

        .widget-dnd > switch slider {
          background: #${config.lib.stylix.colors.base05};
          border-radius: 50%;
        }

        .widget-inhibitors {
          background: #${config.lib.stylix.colors.base01};
          padding: 8px 16px;
          margin: 12px 12px 8px 12px;
          border-radius: 12px;
          font-size: 14px;
          color: #${config.lib.stylix.colors.base05};
        }

        .widget-inhibitors > button {
          font-size: 12px;
          color: #${config.lib.stylix.colors.base05};
          background: #${config.lib.stylix.colors.base08};
          border: none;
          border-radius: 8px;
          padding: 4px 8px;
        }

        .widget-inhibitors > button:hover {
          background: alpha(#${config.lib.stylix.colors.base08}, 0.8);
        }

        .widget-label {
          margin: 12px 12px 8px 12px;
        }

        .widget-label > label {
          font-size: 1rem;
          color: #${config.lib.stylix.colors.base05};
        }

        /* MPRIS widget */
        .widget-mpris {
          color: #${config.lib.stylix.colors.base05};
          background: #${config.lib.stylix.colors.base01};
          padding: 8px 16px;
          margin: 12px 12px 8px 12px;
          border-radius: 12px;
        }

        .widget-mpris > box > button {
          border-radius: 8px;
          background: #${config.lib.stylix.colors.base0D};
          color: #${config.lib.stylix.colors.base00};
          border: none;
          margin: 2px;
        }

        .widget-mpris > box > button:hover {
          background: alpha(#${config.lib.stylix.colors.base0D}, 0.8);
        }

        .widget-mpris-player {
          padding: 8px 16px;
          margin: 12px;
        }

        .widget-mpris-title {
          font-weight: 700;
          font-size: 1.25rem;
          color: #${config.lib.stylix.colors.base0B};
        }

        .widget-mpris-subtitle {
          font-size: 1.1rem;
          color: #${config.lib.stylix.colors.base04};
        }

        /* Volume widget */
        .widget-volume {
          background: #${config.lib.stylix.colors.base01};
          padding: 8px 16px;
          margin: 12px 12px 8px 12px;
          border-radius: 12px;
          font-size: x-large;
          color: #${config.lib.stylix.colors.base05};
        }

        .widget-volume > box > button {
          background: #${config.lib.stylix.colors.base0D};
          color: #${config.lib.stylix.colors.base00};
          border: none;
          border-radius: 8px;
          margin: 2px;
        }

        .widget-volume > box > button:hover {
          background: alpha(#${config.lib.stylix.colors.base0D}, 0.8);
        }

        .per-app-volume {
          background-color: #${config.lib.stylix.colors.base00};
          padding: 8px 12px;
          margin: 4px 8px 8px;
          border-radius: 8px;
          border: 1px solid #${config.lib.stylix.colors.base03};
        }

        /* Backlight widget */
        .widget-backlight {
          background: #${config.lib.stylix.colors.base01};
          padding: 8px 16px;
          margin: 12px 12px 8px 12px;
          border-radius: 12px;
          font-size: x-large;
          color: #${config.lib.stylix.colors.base05};
        }

        .widget-backlight > box > button {
          background: #${config.lib.stylix.colors.base0A};
          color: #${config.lib.stylix.colors.base00};
          border: none;
          border-radius: 8px;
          margin: 2px;
        }

        .widget-backlight > box > button:hover {
          background: alpha(#${config.lib.stylix.colors.base0A}, 0.8);
        }

        /* Menu bar */
        .widget-menubar > box > .menu-button-bar > button {
          border: none;
          background: transparent;
        }

        .topbar-buttons > button {
          border: none;
          background: transparent;
        }

        /* Urgency levels */
        .low {
          background: alpha(#${config.lib.stylix.colors.base0C}, 0.1);
          border: 2px solid #${config.lib.stylix.colors.base0C};
        }

        .normal {
          background: alpha(#${config.lib.stylix.colors.base0D}, 0.1);
          border: 2px solid #${config.lib.stylix.colors.base0D};
        }

        .critical {
          background: alpha(#${config.lib.stylix.colors.base08}, 0.2);
          border: 2px solid #${config.lib.stylix.colors.base08};
          animation: blink 1s linear infinite alternate;
        }

        @keyframes blink {
          to {
            background: alpha(#${config.lib.stylix.colors.base08}, 0.5);
          }
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
  };
}
