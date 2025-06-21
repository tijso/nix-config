{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:
with lib;
let
  tuigreet = "${pkgs.greetd.tuigreet}/bin/tuigreet";
  niri-session = "${pkgs.niri-unstable}/bin/niri-session";
in
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

    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${tuigreet}/bin/tuigreet --time --remember --cmd ${niri-session}";
          user = "tijso";
        };
      };
    };

    # Start Ssh
    # programs.ssh.startAgent = false;

    # Disable GNOME's SSH agent when using Niri
    services.gnome.gnome-keyring.enable = lib.mkForce true;
    programs.gnome-keyring.enable = lib.mkForce false;

    # Enable your preferred SSH agent
    programs.ssh.startAgent = true;

    # You might need this to prevent SSH conflict
    environment.variables = {
      SSH_AUTH_SOCK = lib.mkForce "/run/user/1000/ssh-agent.socket";
    };

    # services.displayManager.sddm = {
    #   enable = true;
    #   wayland.enable = true;
    #   enableHidpi = true;
    #   autoNumlock = true;
    #   theme = "catppuccin";
    # };

    # services.displayManager.sessionPackages = [ pkgs.niri ];

    # environment.systemPackages = with pkgs; [
    #   catppuccin-sddm
    #   sddm-sugar-dark
    #   libsForQt5.qt5.qtgraphicaleffects
    # ];
  };
}
