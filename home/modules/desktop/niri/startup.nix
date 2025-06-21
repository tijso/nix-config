{
  pkgs,
  ...
}:
{
  # Regular startup programs
  programs.niri.settings.spawn-at-startup = [
    { command = [ "${pkgs.waybar}/bin/waybar" ]; }
    { command = [ "${pkgs.mako}/bin/mako" ]; }
  ];

  # SWWW service and wallpaper setup
  services.swww = {
    enable = true;
    package = pkgs.swww;
  };

  # Set wallpaper after swww starts
  systemd.user.services.set-wallpaper = {
    Unit = {
      Description = "Set desktop wallpaper";
      After = [ "swww.service" ];
      Wants = [ "swww.service" ];
    };

    Service = {
      Type = "oneshot";
      ExecStart = "${pkgs.swww}/bin/swww img ${../../theming/Wallpapers/serenity.jpg} --transition-type wipe --transition-duration 2";
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
