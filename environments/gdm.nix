{pkgs, ...}: {
  services.xserver.displayManager.gdm = {
    enable = true;
    wayland = true;
    gdmCustomize = ''
      gtk-theme = "Adwaita"
    '';
  };

  security.pam.services.gdm.enableGnomeKeyring = true;
}
