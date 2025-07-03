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
      swww
      wayland-protocols
      wayland-utils
      wayshot
      wf-recorder
      wl-clipboard
      wl-color-picker
      wlr-randr
      ydotool
    ];

    programs.niri = {
      enable = true;
      settings = {
        animations.enable = true;
        clipboard.disable-primary = true;
        prefer-no-csd = true;
        hotkey-overlay.skip-at-startup = true;
        screenshot-path = "~/Pictures/Screenshots/%Y-%m-%dT%H:%M:%S.png";

        home.sessionVariables = {
          BROWSER = config.myHome.desktop.niri.browser;
          MOZ_ENABLE_WAYLAND = "1";
          NIXOS_OZONE_WL = "1";
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
          always-center-single-column = true;
          preset-column-widths = [
            {proportion = 1.0 / 3.0;}
            {proportion = 1.0 / 2.0;}
            {proportion = 2.0 / 3.0;}
            {proportion = 3.0 / 4.0;}
          ];
          default-column-width = {
            proportion = 1.0 / 2.0;
          };

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
