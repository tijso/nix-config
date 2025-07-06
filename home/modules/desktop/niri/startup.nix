{
  pkgs,
  config,
  ...
}: {
  programs.niri.settings.spawn-at-startup = [
    {command = ["${pkgs.waybar}/bin/waybar"];}
    {command = ["${pkgs.mako}/bin/mako"];}
    {
      command = [
        "${pkgs._1password-gui}/bin/1password"
        "--silent"
      ];
    }

    {
      command = [
        "${pkgs.swww}/bin/swww"
        "img"
        "${config.stylix.image}"
        "--transition-type"
        "wipe"
        "--transition-duration"
        "2"
      ];
    }
  ];
}
