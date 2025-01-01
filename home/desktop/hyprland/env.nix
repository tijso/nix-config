{...}: {
  wayland.windowManager.hyprland.settings.env = [
    "XCURSOR_SIZE,20"
    "XDG_CURRENT_DESKTOP,Hyprland"
    "XDG_SESSION_DESKTOP,Hyprland"
    "XDG_SESSION_TYPE,wayland"
    "ELECTRON_OZONE_PLATFORM_HINT,wayland"

    "QT_QPA_PLATFORM=wayland,xcb"
    "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
    "NIXOS_OZONE_WL,1"
    "MOZ_ENABLE_WAYLAND,1"
    "SDL_VIDEODRIVER,wayland"
  ];
}
