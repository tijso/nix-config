{pkgs, ...}: {
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    bind = [
      # Programs
      "$mod, Q, killactive,"
      "$mod  SHIFT, C, exit,"
      "$mod, RETURN, exec, wezterm"
      "$mod, B, exec, brave"
      "$mod, E, exec, thunar"
      "$mod, D, exec, grim -g  discord"

      # Rofi
      "$mod, R, exec, rofi -show drun -theme $rofi_theme $focus_rofi"
      "$mod, Equal, exec, rofi -modi calc -show calc -theme $rofi_theme $focus_rofi"
      "$mod, N, exec, dunstctl action $focus_rofi"
      "$mod, V, exec, cliphist list | rofi -dmenu -p C -theme $rofi_theme | cliphist decode | wl-copy $focus_rofi"

      # Tiling
      "$mod, F, fullscreen,"
      "$mod, T, togglefloating,"
      "$mod, H, movefocus, l"
      "$mod, L, movefocus, r"
      "$mod, K, movefocus, u"
      "$mod, J, movefocus, d"

      # Move window with mainMod + shift
      "$mod SHIFT, L, movewindow, r"
      "$mod SHIFT, H, movewindow, l"
      "$mod SHIFT, K, movewindow, u"
      "$mod SHIFT, J, movewindow, d"

      # Switch workspaces
      "$mod, 1, workspace, 1"
      "$mod, 2, workspace, 2"
      "$mod, 3, workspace, 3"
      "$mod, 4, workspace, 4"
      "$mod, 5, workspace, 5"
      "$mod, 6, workspace, 6"
      "$mod, 7, workspace, 7"
      "$mod, 8, workspace, 8"
      "$mod, 9, workspace, 9"
      "$mod, 0, workspace, 10"

      # Move active window to a workspace
      "$mod SHIFT, 1, movetoworkspace, 1"
      "$mod SHIFT, 2, movetoworkspace, 2"
      "$mod SHIFT, 3, movetoworkspace, 3"
      "$mod SHIFT, 4, movetoworkspace, 4"
      "$mod SHIFT, 5, movetoworkspace, 5"
      "$mod SHIFT, 6, movetoworkspace, 6"
      "$mod SHIFT, 7, movetoworkspace, 7"
      "$mod SHIFT, 8, movetoworkspace, 8"
      "$mod SHIFT, 9, movetoworkspace, 9"
      "$mod SHIFT, 0, movetoworkspace, 10"

      # Resizing
      "$mod ALT, L, resizeactive, 20 0"
      "$mod ALT, H, resizeactive, -20 0"
      "$mod ALT, K, resizeactive, 0 -20"
      "$mod ALT, J, resizeactive, 0 20"

      # Audio
      "$mod, P, exec, playerctl play-pause"
      "$mod, M, exec, swayosd-client --input-volume mute-toggle"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPrev, exec, playerctl prev"
      ", XF86AudioMute, exec, swayosd-client --output-volume mute-toggle"
      ", XF86AudioMicMute, exec, swayosd-client --input-volume mute-toggle"
    ];
    binde = [
      ", XF86AudioRaiseVolume, exec, swayosd-client --output-volume raise"
      ", XF86AudioLowerVolume, exec, swayosd-client --output-volume lower"
      "SHIFT, XF86AudioRaiseVolume, exec, swayosd-client --input-volume raise"
      "SHIFT, XF86AudioLowerVolume, exec, swayosd-client --input-volume lower"
      ", XF86MonBrightnessDown, exec, swayosd-client --brightness -10"
      ", XF86MonBrightnessUp, exec, swayosd-client --brightness +10"
    ];
    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];
  };
}
