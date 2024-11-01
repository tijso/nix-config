{pkgs, ...}: {
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    bind =
      [
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
        "$mod SHIFT, H, movewindow, l"
        "$mod SHIFT, L, movewindow, r"
        "$mod SHIFT, K, movewindow, u"
        "$mod SHIFT, J, movewindow, d"

        # Workspaces
        # "$mod, bracketright, workspace, +1"
        # "$mod, bracketleft, workspace, -1"
        # "$mod, CONTROL, bracketright, movetoworkspace, +1"
        # "$mod, CONTROL, bracketleft, movetoworkspace, -1"

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

    ++ map (i: workspace (toString i)) workspaceArr
    ++ map (i: moveToWorkspace (toString i)) workspaceArr
    ++ map (i: moveToWorkspaceSilent (toString i)) workspaceArr;
  };
}
