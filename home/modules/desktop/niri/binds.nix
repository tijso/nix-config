{
  pkgs,
  config,
  ...
}:
{
  programs.niri.settings.binds = with config.lib.niri.actions; {
    "Mod+Return".action = spawn "ghostty";
    "Mod+Shift+Return".action = spawn "wezterm";
    "Mod+D".action = spawn "${pkgs.fuzzel}/bin/fuzzel";
    "Mod+B".action = spawn "${pkgs.brave}/bin/brave";
    "Mod+E".action = spawn "${pkgs.nautilus}/bin/nautilus";

    # Window management
    "Mod+Q".action = close-window;
    "Mod+F".action = maximize-column;
    "Mod+Shift+F".action = fullscreen-window;
    "Mod+C".action = center-column;

    # Focus
    "Mod+H".action = focus-column-left;
    "Mod+L".action = focus-column-right;
    "Mod+J".action = focus-window-down;
    "Mod+K".action = focus-window-up;
    "Mod+Left".action = focus-column-left;
    "Mod+Right".action = focus-column-right;
    "Mod+Down".action = focus-window-down;
    "Mod+Up".action = focus-window-up;

    # Move windows
    "Mod+Shift+H".action = move-column-left;
    "Mod+Shift+L".action = move-column-right;
    "Mod+Shift+J".action = move-window-down;
    "Mod+Shift+K".action = move-window-up;
    "Mod+Shift+Left".action = move-column-left;
    "Mod+Shift+Right".action = move-column-right;
    "Mod+Shift+Down".action = move-window-down;
    "Mod+Shift+Up".action = move-window-up;

    # Workspaces
    "Mod+1".action = focus-workspace 1;
    "Mod+2".action = focus-workspace 2;
    "Mod+3".action = focus-workspace 3;
    "Mod+4".action = focus-workspace 4;
    "Mod+5".action = focus-workspace 5;
    "Mod+Shift+1".action = move-column-to-workspace 1;
    "Mod+Shift+2".action = move-column-to-workspace 2;
    "Mod+Shift+3".action = move-column-to-workspace 3;
    "Mod+Shift+4".action = move-column-to-workspace 4;
    "Mod+Shift+5".action = move-column-to-workspace 5;

    # Column resizing
    "Mod+R".action = switch-preset-column-width;
    "Mod+Shift+R".action = reset-window-height;
    "Mod+Ctrl+H".action = consume-window-into-column;
    "Mod+Ctrl+L".action = expel-window-from-column;

    # Screenshots
    "Print".action = screenshot;
    "Mod+Ctrl+Print".action = screenshot-screen;
    "Mod+Alt+Print".action = screenshot-window;

    # "Print".action.screenshot-screen = {write-to-disk = true;};
    # "Mod+Shift+Alt+S".action = screenshot-window;
    # "Mod+Shift+S".action.screenshot = {show-pointer = false;};

    # Media keys
    "XF86AudioRaiseVolume".action = spawn [
      "${pkgs.wireplumber}/bin/wpctl"
      "set-volume"
      "@DEFAULT_AUDIO_SINK@"
      "0.1+"
    ];
    "XF86AudioLowerVolume".action = spawn [
      "${pkgs.wireplumber}/bin/wpctl"
      "set-volume"
      "@DEFAULT_AUDIO_SINK@"
      "0.1-"
    ];
    "XF86AudioMute".action = spawn [
      "${pkgs.wireplumber}/bin/wpctl"
      "set-mute"
      "@DEFAULT_AUDIO_SINK@"
      "toggle"
    ];
    "XF86AudioMicMute".action = spawn [
      "${pkgs.wireplumber}/bin/wpctl"
      "set-mute"
      "@DEFAULT_AUDIO_SOURCE@"
      "toggle"
    ];
    "XF86MonBrightnessUp".action = spawn [
      "${pkgs.brightnessctl}/bin/brightnessctl"
      "set"
      "10%+"
    ];
    "XF86MonBrightnessDown".action = spawn [
      "${pkgs.brightnessctl}/bin/brightnessctl"
      "set"
      "10%-"
    ];
    "XF86AudioNext".action = spawn [
      "${pkgs.playerctl}/bin/playerctl"
      "next"
    ];
    "XF86AudioPrev".action = spawn [
      "${pkgs.playerctl}/bin/playerctl"
      "previous"
    ];
    "XF86AudioPlay".action = spawn [
      "${pkgs.playerctl}/bin/playerctl"
      "play-pause"
    ];

    # System
    "Mod+Shift+E".action = quit;
    "Mod+Shift+P".action = power-off-monitors;
  };
}
