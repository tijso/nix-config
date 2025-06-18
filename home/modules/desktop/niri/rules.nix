{
  ...
}:
{
  programs.niri.settings.window-rules = [
    {
      matches = [ { app-id = "^com\.mitchellh\.ghostty$"; } ];
      default-column-width = {
        proportion = 0.5;
      };
    }
    {
      matches = [ { app-id = "^brave-browser$"; } ];
      default-column-width = {
        proportion = 0.75;
      };
    }
  ];
}
