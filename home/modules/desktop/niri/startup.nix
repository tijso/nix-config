{
  pkgs,
  ...
}:
{
  programs.niri.settings.spawn-at-startup = [
    { command = [ "${pkgs.waybar}/bin/waybar" ]; }
    {
      command = [
        "${pkgs.swww}/bin/swww"
        "init"
      ];
    }
    { command = [ "${pkgs.mako}/bin/mako" ]; }
  ];
}
