{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  imports = [
    inputs.niri.nixosModules.niri
    ./sddm
    # ./greetd
  ];

  options.myModules.desktop.niri.enable = mkEnableOption "Enable Niri";
  config = mkIf config.myModules.desktop.niri.enable {
    programs = {
      xwayland.enable = true;
      niri = {
        enable = true;
        package = pkgs.niri-unstable;
      };
    };
    environment.systemPackages = with pkgs; [
      wayland
      wayland-protocols
      wayland-utils
      wlr-randr
    ];

    # services.greetd = {
    #   enable = true;
    #   settings = {
    #     default_session = {
    #       command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --cmd ${pkgs.niri-unstable}/bin/niri-session";
    #       user = "greeter";
    #     };
    #   };
    # };

    services = {
      displayManager.sessionPackages = [pkgs.niri-unstable];
      gnome.gnome-keyring.enable = lib.mkForce false;
      gnome.gcr-ssh-agent.enable = lib.mkForce false;
    };

    security.polkit.enable = true;
    systemd.user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = ["graphical-session.target"];
      wants = ["graphical-session.target"];
      after = ["graphical-session.target"];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };

    environment.variables = {
      MOZ_ENABLE_WAYLAND = "1";
      NIXOS_OZONE_WL = "1";
      WAYLAND_DISPLAY = "wayland-0";
    };

    xdg.portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-wlr
      ];

      config.common.default = "*";
    };
  };
}
