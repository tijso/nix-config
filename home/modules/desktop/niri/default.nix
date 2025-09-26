{
  pkgs,
  config,
  lib,
  ...
}:
with lib; {
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
      grim
      slurp
      wayland-protocols
      wayland-utils
      wayshot
      wf-recorder
      wl-clipboard
      wl-color-picker
      wlr-randr
      ydotool
    ];

    services.swww = {
      enable = true;
      package = pkgs.swww;
    };

    programs.niri = {
      enable = true;
      settings = {
        animations.enable = true;
        clipboard.disable-primary = true;
        prefer-no-csd = true;
        hotkey-overlay.skip-at-startup = true;
        screenshot-path = "~/Pictures/Screenshots/%Y-%m-%dT%H:%M:%S.png";
        xwayland-satellite.enable = true;
        environment = {
          CLUTTER_BACKEND = "wayland";
          QT_QPA_PLATFORMTHEME = "qt6ct";
          QT_QPA_PLATFORM = "wayland;xcb";
          ELECTRON_OZONE_PLATFORM_HINT = "auto";
          ELECTRON_ENABLE_HARDWARE_ACCELERATION = "1";
          OZONE_PLATFORM = "wayland";
          MOZ_ENABLE_WAYLAND = "1";
          NIXOS_OZONE_WAYLAND_AUTO = "1";
          NIXOS_OZONE_WL = "1";
          XDG_CURRENT_DESKTOP = "Niri";

          GDK_SCALE = "1.25";
          GDK_DPI_SCALE = "1.0";
          QT_SCALE_FACTOR = "1.25";
          XCURSOR_SIZE = "32";
          QT_AUTO_SCREEN_SCALE_FACTOR = "1";
          QT_ENABLE_HIGHDPI_SCALING = "1";
        };

        input = {
          focus-follows-mouse.enable = true;
          power-key-handling.enable = true;
          workspace-auto-back-and-forth = true;
          keyboard = {
            xkb = {
              layout = "us";
              options = "caps:escape";
            };
            repeat-delay = 600;
            repeat-rate = 25;
          };

          mouse = {
            natural-scroll = false;
            accel-profile = "adaptive";
          };
        };

        outputs = {
          "DP-1" = {
            mode = {
              width = 3840;
              height = 2160;
              refresh = null;
            };
            scale = 1.25;
            position = {
              x = 2048;
              y = 0;
            };
          };

          "DP-2" = {
            mode = {
              width = 2560;
              height = 1440;
              refresh = 144.0;
            };
            scale = 1.0;
            position = {
              x = 0;
              y = 0;
            };
          };
        };

        layout = {
          gaps = 15;
          center-focused-column = "never";
          always-center-single-column = true;
          default-column-width = {proportion = 0.750000;};
          preset-column-widths = [
            {proportion = 0.330000;}
            {proportion = 0.500000;}
            {proportion = 0.750000;}
            {proportion = 1.000000;}
          ];

          focus-ring = {
            enable = true;
            width = 2;
            active.color = config.lib.stylix.colors.base0D;
            inactive.color = config.lib.stylix.colors.base02;
          };

          border = {
            enable = true;
            width = 2;
            active.color = config.lib.stylix.colors.base0D;
            inactive.color = config.lib.stylix.colors.base02;
          };

          tab-indicator = {
            hide-when-single-tab = true;
            place-within-column = true;
            position = "left";
            corner-radius = 20.0;
            gap = -12.0;
            gaps-between-tabs = 10.0;
            width = 4.0;
            length.total-proportion = 0.1;
          };
        };
      };
    };

    # # XDG settings for default applications
    # xdg.mimeApps = {
    #   enable = true;
    #   defaultApplications = {
    #     "text/html" = "brave-browser.desktop";
    #     "x-scheme-handler/http" = "brave-browser.desktop";
    #     "x-scheme-handler/https" = "brave-browser.desktop";
    #     "x-scheme-handler/about" = "brave-browser.desktop";
    #     "x-scheme-handler/unknown" = "brave-browser.desktop";
    #   };
    # };
  };
}
