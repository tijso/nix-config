{
  pkgs,
  ...
}:
{
  programs.niri.settings.spawn-at-startup = [
    { command = [ "${pkgs.waybar}/bin/waybar" ]; }
    {
      command = [
        "init"
        "${pkgs.swww}/bin/swww"
        "img"
        "${../../theming/Wallpapers/serenity.jpg}"
        "--transition-type"
        "wipe"
        "--transition-duration"
        "2"
        # "${pkgs.swww}/bin/swww """
      ];
    }
    { command = [ "${pkgs.mako}/bin/mako" ]; }
  ];
}
