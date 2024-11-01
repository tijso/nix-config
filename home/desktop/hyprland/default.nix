{
  inputs,
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [
    ./animations.nix
    ./env.nix
    ./keybindings.nix
    ./rules.nix
    ./theme.nix
  ];

  home.packages = with pkgs; [
    clipse
    grim
    slurp
    swappy
    swaynotificationcenter
    swww
    wl-clipboard
    wl-color-picker
    wlr-randr
    wayland-utils
    wayland-protocols
    ydotool
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
    settings = {
      exec-once = [
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
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

      monitor = [
        "DP-1,2560x1440,1920x0, 1"
        "DP-2,1920x108, 0x0 1"
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
