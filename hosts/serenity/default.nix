{
  pkgs,
  ...
}:
{
  imports = [
    # ./disks.nix
    ./hardware-configuration.nix
    ./users.nix

    ../../modules
  ];

  myModules = {
    core = {
      audio.enable = true;
      bluetooth.enable = true;
      # boot.enable = true;
      gpu.enable = true;
      network.enable = true;
      nix.enable = true;
      pkgs.enable = true;
      security.enable = true;
      services.enable = true;
      _1password.enable = true;
      boot = {
        enable = true;
        plymouth = {
          enable = true;
          theme = "rings";
        };
        grubTheme = {
          enable = true;
          resolution = "1920x1080";
        };
      };
    };

    desktop = {
      cosmic.enable = false;
      gnome.enable = false;
      hyprland.enable = false;
      niri.enable = true;
    };

    development.enable = true;
    stylix.enable = true;
    thunar.enable = true;
  };

  system.stateVersion = "23.11";
}
