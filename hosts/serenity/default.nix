{config, ...}: {
  imports = [
    # ./disks.nix
    ./hardware-configuration.nix
    ./users.nix

    ../../modules
  ];

  assertions = [
    {
      assertion = !(config.myModules.desktop.niri.enable && config.myModules.desktop.hyprland.enable);
      message = "Don't enable both Niri and Hyprland at the same time!";
    }
  ];

  myModules = {
    core = {
      boot = {
        enable = true;
        plymouth = {
          enable = true;
        };
      };
      _1password.enable = true;
      fonts.enable = true;
      gpu.enable = true;
      network.enable = true;
      nix.enable = true;
      pkgs.enable = true;
      security.enable = true;
      services.enable = true;
    };

    desktop = {
      cosmic.enable = false;
      gnome.enable = false;
      hyprland.enable = false;
      niri.enable = true;
      sddm.enable = false;
      greetd.enable = false;
    };

    development.enable = true;
    stylix.enable = true;
  };

  system.stateVersion = "23.11";
}
