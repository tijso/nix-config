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

    # Disable GNOME's SSH agent component to avoid conflicts
    services.gnome.gcr-ssh-agent.enable = lib.mkForce false;

    # Start Ssh
    programs.ssh.startAgent = true;

    # You might need this to prevent SSH conflict
    environment.variables = {
      SSH_AUTH_SOCK = lib.mkForce "/run/user/1000/ssh-agent.socket";
    };

    # PAM configuration to unlock keyring on login
    security.pam.services.greetd.enableGnomeKeyring = true;
    security.pam.services.login.enableGnomeKeyring = true;

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
