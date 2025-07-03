{...}: {
  programs.niri.settings.window-rules = [
    {
      geometry-corner-radius = let
        radius = 16.0;
      in {
        top-left = radius;
        top-right = radius;
        bottom-left = radius;
        bottom-right = radius;
      };
      clip-to-geometry = true;
      draw-border-with-background = false;
      variable-refresh-rate = true;
    }

    {
      matches = [
        {app-id = "^org\.wezfurlong\.wezterm$";}
        {app-id = "^com\.mitchellh\.ghostty$";}
      ];
      default-column-width = {
        proportion = 0.5;
      };
    }

    {
      matches = [{is-focused = false;}];
      opacity = 0.95;
    }

    {
      matches = [
        {app-id = "brave-browser";}
        {app-id = "xdg-desktop-portal-gtk";}
      ];
      scroll-factor = 0.2;
    }

    {
      matches = [
        {app-id = "brave-browser";}
      ];
      open-maximized = true;
    }

    {
      matches = [{app-id = "^org.gnome.Nautilus$";}];
      default-column-width = {
        proportion = 0.6;
      };
    }

    {
      matches = [{app-id = "^mpv$";}];
      default-column-width = {
        proportion = 0.4;
      };
    }

    {
      matches = [
        {title = "^(Open|Save|Choose)";}
        {app-id = "^(zenity|yad)$";}
      ];
      open-floating = true;
    }
  ];
}
