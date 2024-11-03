{...}: {
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "systemctl --user import-environment QT_QPA_PLATFORMTHEME WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"

      "waybar &"
      "swaync &"
      "swww init &"
      "cliphist wipe &"
      "xsetroot -cursor_name left_ptr &"
    ];
  };
}
