{
  pkgs,
  config,
  lib,
  ...
}:
with lib;
{
  imports = [
    ./binds.nix
    ./startup.nix
    ./rules.nix
  ];

  options.myHome.desktop.niri = {
    enable = mkEnableOption "Enable Niri";
    browser = mkOption {
      type = types.str;
      default = "brave";
      description = "Default browser to use";
    };
  };

  config = mkIf config.myHome.desktop.niri.enable {
    home.packages = with pkgs; [
      swww
      grim
      slurp
      wl-clipboard
    ];

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

        "eDP-1" = {
          scale = 1.0;
          transform.normal = { };
        };

        "DP-1" = {
          mode = "2560x1440";
          scale = 1.0;
          focus-at-startup = true;
          position = {
            x = 2048;
            y = 0;
          };
        };

        output."DP-2" = {
          mode = "2048x1152";
          scale = 1.0;
          position = {
            x = 0;
            y = 0;
          };
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
            active.color = config.colorScheme.palette.base0D;
            inactive.color = config.colorScheme.palette.base02;
          };
          border = {
            enable = true;
            width = 2;
            active.color = config.colorScheme.palette.base0D;
            inactive.color = config.colorScheme.palette.base02;
          };
        };

        prefer-no-csd = true;
        hotkey-overlay.skip-at-startup = true;

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

    # Session variables
    home.sessionVariables = {
      BROWSER = config.myHome.desktop.niri.browser;
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

    # Set wallpaper script
    home.file."bin/set-wallpaper" = {
      text = ''
        #!/bin/sh
        ${pkgs.swww}/bin/swww img "$1" --transition-type wipe --transition-duration 2
      '';
      executable = true;
    };
  };
}
