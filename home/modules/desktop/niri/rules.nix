{
  ...
}:
{
  programs.niri.settings.window-rules = [
    {
      geometry-corner-radius = {
        top-left = 8.0;
        top-right = 8.0;
        bottom-left = 8.0;
        bottom-right = 8.0;
      };
      clip-to-geometry = true;
      matches = [ { app-id = "^com\.mitchellh\.ghostty$"; } ];
      default-column-width = {
        proportion = 0.5;
      };
    }

    {
      matches = [ { app-id = "^org\.wezfurlong\.wezterm$"; } ];
      default-column-width = {
        proportion = 0.5;
      };
    }

    {
      matches = [ { is-focused = false; } ];
      opacity = 0.95;
    }

    {
      matches = [ { app-id = "^brave-browser$"; } ];
      default-column-width = {
        proportion = 0.75;
      };
    }

    {
      matches = [ { app-id = "^org\.gnome\.Nautilus$"; } ];
      default-column-width = {
        proportion = 0.6;
      };
    }

    {
      matches = [ { app-id = "^mpv$"; } ];
      default-column-width = {
        proportion = 0.4;
      };
    }

    {
      matches = [
        { title = "^(Open|Save|Choose)"; }
        { app-id = "^(zenity|yad)$"; }
      ];
      open-floating = true;
    }
  ];
}
