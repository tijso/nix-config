{pkgs, ...}: {
  services.xserver.displayManager.gdm = {
    enable = true;
    wayland = true;
    extraConfig = ''
      [org/gnome/login-screen]
      gtk-theme = "Adwaita"
    '';
  };

  security.pam.services.gdm.enableGnomeKeyring = true;
}
