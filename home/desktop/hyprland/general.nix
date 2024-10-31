{config, ...}: {
  wayland.windowManager.hyprland = {
    settings = {
      monitor = [
        "DP-1,2560x1440,1920x0, 1"
        "DP-2,1920x108, 0x0 1"
      ];

      workspace = [
        "1,monitor:DP-1,default:true"
        "2,monitor:DP-1"
        "3,monitor:DP-1"
        "4,monitor:DP-1"
        "5,monitor:DP-1"

        "6,monitor:DP-2,default:true"
        "7,monitor:DP-2"
        "8,monitor:DP-2"
        "9,monitor:DP-2"
        "10,monitor:DP-2"
      ];

      extraConfig = ''
        env = NIXOS_OZONE_WL, 1
        env = NIXPKGS_ALLOW_UNFREE, 1
        env = XDG_CURRENT_DESKTOP, Hyprland
        env = XDG_SESSION_TYPE, wayland
        env = XDG_SESSION_DESKTOP, Hyprland
        env = GDK_BACKEND, wayland, x11
        env = CLUTTER_BACKEND, wayland
        env = QT_QPA_PLATFORM,wayland;xcb
        env = QT_WAYLAND_DISABLE_WINDOWDECORATION,1
        env = QT_AUTO_SCREEN_SCALE_FACTOR,1
        env = SDL_VIDEODRIVER, wayland
        env = MOZ_ENABLE_WAYLAND, 1
      '';

      exec-once = [
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        # "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"
        "systemctl --user import-environment QT_QPA_PLATFORMTHEME WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"

        "waybar"
        "swaync"
        "swww init"
        # "nm-applet --indicator"

        # "exec-once = swww img /home/${username}/Pictures/Wallpapers/1331008.png"

        # "[workspace 1 silent] discord"
        # "[workspace 6 silent] brave"
        # "[workspace 6 silent] wezterm start btop"
        # "[workspace 10 silent] qbittorrent"
      ];

      input = {
        kb_layout = "us";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = false;
        };
        sensitivity = -0.5;
        repeat_delay = 200;
        repeat_rate = 50;
      };

      misc = {
        key_press_enables_dpms = true;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        background_color = "rgb(${config.colorScheme.palette.base01})";
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
        no_gaps_when_only = 0;
        force_split = 2;
      };

      master = {
        new_is_master = true;
        no_gaps_when_only = 0;
        mfact = 0.3;
      };

      gestures = {
        workspace_swipe = false;
      };
    };
  };
}
