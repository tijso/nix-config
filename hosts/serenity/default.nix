{...}: {
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
    };

    development.enable = true;
    stylix.enable = true;
  };

  services.unclutter = {
    enable = true;
    timeout = 1;
    extraOptions = [
      "exclude-root"
      "ignore-scrolling"
    ];
  };

  system.stateVersion = "23.11";
}
