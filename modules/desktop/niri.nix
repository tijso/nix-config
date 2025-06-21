{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:
with lib;
{

  imports = [
    inputs.niri.nixosModules.niri
  ];

  options.myModules.desktop.niri.enable = mkEnableOption "Enable Niri";
  config = mkIf config.myModules.desktop.niri.enable {
    programs.niri = {
      enable = true;
      package = pkgs.niri-unstable;
    };

    environment.systemPackages = with pkgs; [
      catppuccin-sddm
      sddm-sugar-dark
      libsForQt5.qt5.qtgraphicaleffects
      wayland
      wayland-protocols
      wayland-utils
    ];

    # services.greetd = {
    #   enable = true;
    #   settings = {
    #     default_session = {
    #       command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --cmd ${pkgs.niri-unstable}/bin/niri-session";
    #       user = "tijso";
    #     };
    #   };
    # };

    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      enableHidpi = true;
      autoNumlock = true;
      theme = "catppuccin";
    };

    services.displayManager.sessionPackages = [ pkgs.niri-unstable ];

    # System services and authentication
    programs.ssh.startAgent = true;
    services.gnome.gnome-keyring.enable = lib.mkForce false;
    services.gnome.gcr-ssh-agent.enable = lib.mkForce false;

    # PAM configuration for keyring
    # security.pam.services.greetd.enableGnomeKeyring = true;
    security.pam.services.login.enableGnomeKeyring = true;
    security.pam.services.sddm.enableGnomeKeyring = true;

    environment.variables = {
      MOZ_ENABLE_WAYLAND = "1";
      NIXOS_OZONE_WL = "1";
      WAYLAND_DISPLAY = "wayland-0";
    };

    # Enable necessary system services
    services.dbus.enable = true;
    services.udev.enable = true;
    security.polkit.enable = true;
  };
}
