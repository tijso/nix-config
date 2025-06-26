{
  pkgs,
  config,
  ...
}: {
  programs.niri.settings.binds = with config.lib.niri.actions; let
    set-volume = spawn "${pkgs.wireplumber}/bin/wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@";
    brightness = spawn "${pkgs.brightnessctl}/bin/brightnessctl" "set";
    playerctl = spawn "${pkgs.playerctl}/bin/playerctl";
    sh = spawn "sh" "-c";
  in {
    "Mod+Return".action = spawn "ghostty";
    "Mod+O".action = show-hotkey-overlay;
    "Mod+D".action = spawn "${pkgs.fuzzel}/bin/fuzzel";
    "Mod+B".action = spawn "${pkgs.brave}/bin/brave";
    "Mod+E".action = spawn "${pkgs.nautilus}/bin/nautilus";

    # Locking
    # "Mod+Shift+L".action = spawn "swaylock"; # or your preferred locker

    # Service restarts (useful for development)
    "Mod+W".action = sh (
      builtins.concatStringsSep "; " [
        "systemctl --user stop waybar.service"
        "systemctl --user stop swww.service"
        "niri msg action restart"
        "sleep 2"
        "systemctl --user start waybar.service"
        "systemctl --user start swww.service"
      ]
    );

    # Window management
    "Mod+Q".action = close-window;
    "Mod+F".action = maximize-column;
    "Mod+Shift+F".action = fullscreen-window;
    "Mod+C".action = center-visible-columns;

    # Column tabbing (NEW - very useful)
    "Mod+Space".action = toggle-column-tabbed-display;

    # Focus
    "Mod+H".action = focus-column-left;
    "Mod+L".action = focus-column-right;
    "Mod+J".action = focus-window-or-workspace-down;
    "Mod+K".action = focus-window-or-workspace-up;
    "Mod+Left".action = focus-column-left;
    "Mod+Right".action = focus-column-right;
    "Mod+Down".action = focus-workspace-down;
    "Mod+Up".action = focus-workspace-up;

    # Smart focus switching (NEW - very useful)
    "Mod+Tab".action = focus-window-down-or-column-right;
    "Mod+Shift+Tab".action = focus-window-up-or-column-left;

    # Floating window support (NEW)
    "Mod+V".action = switch-focus-between-floating-and-tiling;
    "Mod+Shift+V".action = toggle-window-floating;

    # Move windows
    "Mod+Shift+H".action = move-column-left;
    "Mod+Shift+L".action = move-column-right;
    "Mod+Shift+J".action = move-column-to-workspace-down;
    "Mod+Shift+K".action = move-column-to-workspace-up;
    "Mod+Shift+Left".action = move-column-left;
    "Mod+Shift+Right".action = move-column-right;
    "Mod+Shift+Down".action = move-column-to-workspace-down;
    "Mod+Shift+Up".action = move-column-to-workspace-up;

    # Column navigation (NEW - jump to ends quickly)
    "Mod+Home".action = focus-column-first;
    "Mod+End".action = focus-column-last;
    "Mod+Ctrl+Home".action = move-column-to-first;
    "Mod+Ctrl+End".action = move-column-to-last;

    # Workspaces
    "Mod+1".action = focus-workspace 1;
    "Mod+2".action = focus-workspace 2;
    "Mod+3".action = focus-workspace 3;
    "Mod+4".action = focus-workspace 4;
    "Mod+5".action = focus-workspace 5;
    "Mod+Shift+1".action = move-column-to-index 1;
    "Mod+Shift+2".action = move-column-to-index 2;
    "Mod+Shift+3".action = move-column-to-index 3;
    "Mod+Shift+4".action = move-column-to-index 4;
    "Mod+Shift+5".action = move-column-to-index 5;

    # Column resizing
    "Mod+R".action = switch-preset-column-width;
    "Mod+Shift+R".action = reset-window-height;
    "Mod+Ctrl+H".action = consume-window-into-column;
    "Mod+Ctrl+L".action = expel-window-from-column;

    # Alternative column management (NEW - comma/period are easier to remember)
    "Mod+Comma".action = consume-window-into-column;
    "Mod+Period".action = expel-window-from-column;

    # Fine-grained resizing (NEW)
    "Mod+Minus".action = set-column-width "-10%";
    "Mod+Plus".action = set-column-width "+10%";
    "Mod+Shift+Minus".action = set-window-height "-10%";
    "Mod+Shift+Plus".action = set-window-height "+10%";

    # Screenshots
    "Print".action.screenshot-screen = {
      show-pointer = false;
    };
    "Ctrl+Print".action = screenshot-window;
    "Alt+Print".action.screenshot = {
      show-pointer = false;
    };
    "Mod+Shift+S".action = screenshot; # NEW - Interactive screenshot

    # Media keys
    "XF86AudioRaiseVolume".action = set-volume "0.1+";
    "XF86AudioLowerVolume".action = set-volume "0.1-";
    "XF86AudioMute".action =
      spawn "${pkgs.wireplumber}/bin/wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@"
      "toggle";
    "XF86AudioMicMute".action =
      spawn "${pkgs.wireplumber}/bin/wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@"
      "toggle";
    "XF86MonBrightnessUp".action = brightness "10%+";
    "XF86MonBrightnessDown".action = brightness "10%-";
    "XF86AudioNext".action = playerctl "next";
    "XF86AudioPrev".action = playerctl "previous";
    "XF86AudioPlay".action = playerctl "play-pause";

    # System
    "Mod+Shift+E".action = quit;
    "Mod+Shift+P".action = power-off-monitors;

    # Debug/Development (NEW - useful for troubleshooting)
    "Mod+Shift+Ctrl+T".action = toggle-debug-tint;
    "Mod+Shift+Escape".action = toggle-keyboard-shortcuts-inhibit;
  };
}
