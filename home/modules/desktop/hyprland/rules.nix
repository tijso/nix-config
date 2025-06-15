{...}: {
  wayland.windowManager.hyprland = {
    settings = {
      layerrule = [
        "ignorezero, notifications"
        "ignorezero, rofi"
      ];

      windowrule = [
        "float, ^(yad)$"
        "float, ^(MEGAsync)$"
        "noborder, ^(MEGAsync)$"
        "noblur, ^(MEGAsync)$"
        "noshadow, ^(MEGAsync)$"
        "float, ^(KDE Connect Daemon)$"
        "noblur, ^(KDE Connect Daemon)$"
        "opacity 0.85, ^(thunar)$"
        "float, ^(Rofi)$"
        "opacity 1, title:KDE Connect Daemon"
        "noblur, title:KDE Connect Daemon"
        "noborder, title:KDE Connect Daemon"
        "noshadow, title:KDE Connect Daemon"
        "noanim, title:KDE Connect Daemon"
        "nofocus, title:KDE Connect Daemon"
        "suppressevent fullscreen, title:KDE Connect Daemon"
        "float, title:KDE Connect Daemon"
        "pin, title:KDE Connect Daemon"
        "minsize 1920 1080, title:KDE Connect Daemon"
        "move 0 0, title:KDE Connect Daemon"
      ];

      windowrulev2 = [
        "float,class:^(qt5ct)$"
        "float,class:^(nwg-look)$"
        "float,class:^(org.kde.ark)$"
        "float,class:^(pavucontrol)$"
        "float,class:^(blueman-manager)$"
        "float,class:^(nm-applet)$"
        "float,class:^(nm-connection-editor)$"
        "float,class:^(org.kde.polkit-kde-authentication-agent-1)$"
      ];
    };
  };
}
