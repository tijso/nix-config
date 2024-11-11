{ config, pkgs, lib, ... }:

{
  # Enable GTK configuration
  gtk = {
    enable = true;

    theme = {
      name = "Catppuccin-Mocha-Standard-Blue-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "blue" ];
        size = "standard";
        tweaks = [ "normal" ];
        variant = "mocha";
      };
    };

    # Ensure GTK applications prefer dark theme
    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    # Optional: Configure icon theme to match
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    # Optional: Configure cursor theme
    cursorTheme = {
      name = "Catppuccin-Mocha-Dark-Cursors";
      package = pkgs.catppuccin-cursors.mochaDark;
      size = 24;
    };
  };

  # Ensure dconf is enabled for storing GTK settings
  programs.dconf.enable = true;

  # Add required packages to system environment
  environment.systemPackages = with pkgs; [
    gtk-engine-murrine
    gtk_engines
    gsettings-desktop-schemas
    gnome.gnome-settings-daemon
  ];

  # Optional: Configure qt5ct for Qt applications to match GTK theme
  qt = {
    enable = true;
    platformTheme = "gtk";
    style = {
      name = "gtk2";
      package = pkgs.qt5.qtbase.gtk;
    };
  };
}
