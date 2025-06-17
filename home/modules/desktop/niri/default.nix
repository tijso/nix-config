{
  pkgs,
  config,
  lib,
  ...
}:
with lib;
# let
#   inherit (config.lib.stylix) colors;
# in
{
  imports = [
    ./binds.nix
    # ./style.nix
  ];

  options.myHome.desktop.niri = {
    enable = mkEnableOption "Enable Niri with theming";
    browser = mkOption {
      type = types.str;
      default = "brave";
      description = "Default browser to use";
    };
  };

  config = mkIf config.myHome.desktop.niri.enable {
    home.packages = with pkgs; [
      swww # wallpaper daemon
      grim # screenshot
      slurp # screen selection
      wl-clipboard # clipboard utilities
    ];

    # Niri configuration
    programs.niri = {
      enable = true;
      settings = {
        input = {
          keyboard = {
            xkb = {
              layout = "us";
              options = "caps:escape";
            };
            repeat-delay = 600;
            repeat-rate = 25;
          };

          touchpad = {
            tap = true;
            dwt = true;
            natural-scroll = true;
            click-method = "clickfinger";
          };

          mouse = {
            natural-scroll = false;
            accel-speed = 0.2;
          };
        };

        output."eDP-1" = {
          scale = 1.0;
          transform.normal = { };
        };

        layout = {
          gaps = 16;
          center-focused-column = "never";
          preset-column-widths = [
            { proportion = 1.0 / 3.0; }
            { proportion = 1.0 / 2.0; }
            { proportion = 2.0 / 3.0; }
          ];
          default-column-width = {
            proportion = 1.0 / 2.0;
          };
          focus-ring = {
            enable = true;
            width = 3;
            # active.color = colors.base0D;
            # inactive.color = colors.base02;
          };
          border = {
            enable = true;
            width = 2;
            # active.color = colors.base0D;
            # inactive.color = colors.base02;
          };
        };

        prefer-no-csd = true;

        screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";

        hotkey-overlay.skip-at-startup = true;

        spawn-at-startup = [
          { command = [ "${pkgs.waybar}/bin/waybar" ]; }
          {
            command = [
              "${pkgs.swww}/bin/swww"
              "init"
            ];
          }
          { command = [ "${pkgs.mako}/bin/mako" ]; }
        ];

        window-rules = [
          {
            matches = [ { app-id = "^com\.mitchellh\.ghostty$"; } ];
            default-column-width = {
              proportion = 0.5;
            };
          }
          {
            matches = [ { app-id = "^brave-browser$"; } ];
            default-column-width = {
              proportion = 0.75;
            };
          }
        ];

        # binds = with inputs.niri.lib.niri.actions; {
        #   # Applications - Ghostty as main terminal
        #   "Mod+Return".action = spawn "ghostty";
        #   "Mod+Shift+Return".action = spawn "wezterm";
        #   "Mod+D".action = spawn "${pkgs.fuzzel}/bin/fuzzel";
        #   "Mod+B".action = spawn "${pkgs.brave}/bin/brave";
        #   "Mod+E".action = spawn "${pkgs.nautilus}/bin/nautilus";
        #
        #   # Window management
        #   "Mod+Q".action = close-window;
        #   "Mod+F".action = maximize-column;
        #   "Mod+Shift+F".action = fullscreen-window;
        #   "Mod+C".action = center-column;
        #
        #   # Focus
        #   "Mod+H".action = focus-column-left;
        #   "Mod+L".action = focus-column-right;
        #   "Mod+J".action = focus-window-down;
        #   "Mod+K".action = focus-window-up;
        #   "Mod+Left".action = focus-column-left;
        #   "Mod+Right".action = focus-column-right;
        #   "Mod+Down".action = focus-window-down;
        #   "Mod+Up".action = focus-window-up;
        #
        #   # Move windows
        #   "Mod+Shift+H".action = move-column-left;
        #   "Mod+Shift+L".action = move-column-right;
        #   "Mod+Shift+J".action = move-window-down;
        #   "Mod+Shift+K".action = move-window-up;
        #   "Mod+Shift+Left".action = move-column-left;
        #   "Mod+Shift+Right".action = move-column-right;
        #   "Mod+Shift+Down".action = move-window-down;
        #   "Mod+Shift+Up".action = move-window-up;
        #
        #   # Workspaces
        #   "Mod+1".action = focus-workspace 1;
        #   "Mod+2".action = focus-workspace 2;
        #   "Mod+3".action = focus-workspace 3;
        #   "Mod+4".action = focus-workspace 4;
        #   "Mod+5".action = focus-workspace 5;
        #   "Mod+Shift+1".action = move-column-to-workspace 1;
        #   "Mod+Shift+2".action = move-column-to-workspace 2;
        #   "Mod+Shift+3".action = move-column-to-workspace 3;
        #   "Mod+Shift+4".action = move-column-to-workspace 4;
        #   "Mod+Shift+5".action = move-column-to-workspace 5;
        #
        #   # Column resizing
        #   "Mod+R".action = switch-preset-column-width;
        #   "Mod+Shift+R".action = reset-window-height;
        #   "Mod+Ctrl+H".action = consume-window-into-column;
        #   "Mod+Ctrl+L".action = expel-window-from-column;
        #
        #   # Screenshots
        #   "Print".action = screenshot;
        #   "Ctrl+Print".action = screenshot-screen;
        #   "Alt+Print".action = screenshot-window;
        #
        #   # Media keys
        #   "XF86AudioRaiseVolume".action = spawn [
        #     "${pkgs.wireplumber}/bin/wpctl"
        #     "set-volume"
        #     "@DEFAULT_AUDIO_SINK@"
        #     "0.1+"
        #   ];
        #   "XF86AudioLowerVolume".action = spawn [
        #     "${pkgs.wireplumber}/bin/wpctl"
        #     "set-volume"
        #     "@DEFAULT_AUDIO_SINK@"
        #     "0.1-"
        #   ];
        #   "XF86AudioMute".action = spawn [
        #     "${pkgs.wireplumber}/bin/wpctl"
        #     "set-mute"
        #     "@DEFAULT_AUDIO_SINK@"
        #     "toggle"
        #   ];
        #   "XF86AudioMicMute".action = spawn [
        #     "${pkgs.wireplumber}/bin/wpctl"
        #     "set-mute"
        #     "@DEFAULT_AUDIO_SOURCE@"
        #     "toggle"
        #   ];
        #   "XF86MonBrightnessUp".action = spawn [
        #     "${pkgs.brightnessctl}/bin/brightnessctl"
        #     "set"
        #     "10%+"
        #   ];
        #   "XF86MonBrightnessDown".action = spawn [
        #     "${pkgs.brightnessctl}/bin/brightnessctl"
        #     "set"
        #     "10%-"
        #   ];
        #   "XF86AudioNext".action = spawn [
        #     "${pkgs.playerctl}/bin/playerctl"
        #     "next"
        #   ];
        #   "XF86AudioPrev".action = spawn [
        #     "${pkgs.playerctl}/bin/playerctl"
        #     "previous"
        #   ];
        #   "XF86AudioPlay".action = spawn [
        #     "${pkgs.playerctl}/bin/playerctl"
        #     "play-pause"
        #   ];
        #
        #   # System
        #   "Mod+Shift+E".action = quit;
        #   "Mod+Shift+P".action = power-off-monitors;
        # };

        cursor = {
          xcursor-theme = "Adwaita";
          xcursor-size = 24;
        };

        environment = {
          DISPLAY = ":0";
          WAYLAND_DISPLAY = "wayland-0";
        };
      };
    };

    # Set wallpaper script
    home.file."bin/set-wallpaper" = {
      text = ''
        #!/bin/sh
        ${pkgs.swww}/bin/swww img "$1" --transition-type wipe --transition-duration 2
      '';
      executable = true;
    };

    # Session variables
    home.sessionVariables = {
      BROWSER = config.myModules.desktop.niri.browser;
      MOZ_ENABLE_WAYLAND = "1";
      NIXOS_OZONE_WL = "1";
    };

    # XDG settings for default applications
    xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        "text/html" = "brave-browser.desktop";
        "x-scheme-handler/http" = "brave-browser.desktop";
        "x-scheme-handler/https" = "brave-browser.desktop";
        "x-scheme-handler/about" = "brave-browser.desktop";
        "x-scheme-handler/unknown" = "brave-browser.desktop";
      };
    };
  };
}
