{
  pkgs,
  config,
  ...
}:
{
  programs.niri.settings.binds =
    with config.lib.niri.actions;
    let
      set-volume = spawn "${pkgs.wireplumber}/bin/wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@";
      brightness = spawn "${pkgs.brightnessctl}/bin/brightnessctl" "set";
      playerctl = spawn "${pkgs.playerctl}/bin/playerctl";
    in
    {
      "Mod+Return".action = spawn "ghostty";
      "Mod+Shift+Return".action = spawn "wezterm";
      "Mod+D".action = spawn "${pkgs.fuzzel}/bin/fuzzel";
      "Mod+B".action = spawn "${pkgs.brave}/bin/brave";
      "Mod+E".action = spawn "${pkgs.nautilus}/bin/nautilus";
      # Window management
      "Mod+Q".action = close-window;
      "Mod+F".action = maximize-column;
      "Mod+Shift+F".action = fullscreen-window;
      "Mod+C".action = center-visible-columns;
      # Focus
      "Mod+H".action = focus-column-left;
      "Mod+L".action = focus-column-right;
      "Mod+J".action = focus-window-or-workspace-down;
      "Mod+K".action = focus-window-or-workspace-up;
      "Mod+Left".action = focus-column-left;
      "Mod+Right".action = focus-column-right;
      "Mod+Down".action = focus-workspace-down;
      "Mod+Up".action = focus-workspace-up;
      # Move windows
      "Mod+Shift+H".action = move-column-left;
      "Mod+Shift+L".action = move-column-right;
      "Mod+Shift+J".action = move-column-to-workspace-down;
      "Mod+Shift+K".action = move-column-to-workspace-up;
      "Mod+Shift+Left".action = move-column-left;
      "Mod+Shift+Right".action = move-column-right;
      "Mod+Shift+Down".action = move-column-to-workspace-down;
      "Mod+Shift+Up".action = move-column-to-workspace-up;
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
      "Print".action.screenshot-screen = {
        write-to-disk = true;
      };
      "Ctrl+Print".action = screenshot-window;
      "Alt+Print".action.screenshot = {
        show-pointer = false;
        write-to-disk = true;
      };
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
    };
}
