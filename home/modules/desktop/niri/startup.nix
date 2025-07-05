{pkgs, ...}: {
  programs.niri.settings.spawn-at-startup = [
    {command = ["${pkgs.waybar}/bin/waybar"];}
    {command = ["${pkgs.mako}/bin/mako"];}
    {command = ["xwayland-satellite"];}
    {
      command = [
        "${pkgs._1password-gui}/bin/1password"
        "--silent"
      ];
    }
  ];

  services.swww = {
    enable = true;
    package = pkgs.swww;
  };

  # Set wallpaper after swww starts
  # systemd.user.services.set-wallpaper = {
  #   Unit = {
  #     Description = "Set desktop wallpaper";
  # Use the correct service name: swww.service
  #   After = [
  #     "swww.service"
  #     "graphical-session.target"
  #   ];
  #   Requires = [ "swww.service" ];
  #   Wants = [ "graphical-session.target" ];
  # };
  # Service = {
  #   Type = "oneshot";
  #   # Add a small delay to ensure swww daemon is fully ready
  #   ExecStartPre = "${pkgs.coreutils}/bin/sleep 1";
  #   ExecStart = "${pkgs.swww}/bin/swww img ${./serenity.jpg} --transition-type wipe --transition-duration 2";
  #   # Add restart behavior
  #   RemainAfterExit = true;
  # };
  # Install = {
  #   WantedBy = [ "graphical-session.target" ];
  # };
  # };
}
