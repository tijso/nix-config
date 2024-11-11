{pkgs, ...}: {
  services.xserver.displayManager.gdm = {
    enable = true;
    wayland = true;
    };
  };

  security.pam.services.gdm.enableGnomeKeyring = true;
}


  { pkgs, ... }: {
  services.xserver.displayManager.gdm = {
    enable = true;
    wayland = true;
  };

  # Enable required GNOME services
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.gdm.enableGnomeKeyring = true;

  # Enable dconf
  programs.dconf.enable = true;

  # Configure GDM theme through dconf
  services.xserver.desktopManager.gnome.extraGSettingsOverrides = ''
    [org.gnome.desktop.interface]
    gtk-theme='Adwaita'
    icon-theme='Adwaita'
    cursor-theme='Adwaita'

    [org.gnome.login-screen]
    logo='';
''
  # Ensure the theme is available system-wide
  environment.systemPackages = with pkgs; [
    gnome.gnome-themes-extra
    gnome.adwaita-icon-theme
  ];
}
