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
    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd niri-session";
          user = "tijso";
        };
      };
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
