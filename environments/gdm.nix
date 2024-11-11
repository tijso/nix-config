{...}: {
  services.xserver.displayManager.gdm = {
    enable = true;
    wayland = true;
    theme = {
      name = "Adwaita";
      package = pkgs.gnome.adwaita-icon-theme;
    };
  };

  security.pam.services.gdm.enableGnomeKeyring = true;
}
