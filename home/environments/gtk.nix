{
  config,
  pkgs,
  lib,
  ...
}: {
  # Enable GTK configuration
  gtk = {
    enable = true;

    theme = {
      name = "Kanagawa";
      package = pkgs.kanagawa-icon-theme;
      # name = "Catppuccin-Mocha-Standard-Teal-Dark";
      # package = pkgs.catppuccin-gtk.override {
      #   accents = ["teal"];
      #   size = "standard";
      #   tweaks = ["normal"];
      #   variant = "mocha";
      # };
    };

    iconTheme = {
      name = "Kanagawa-BL";
      package = pkgs.kanagawa-gtk-theme;
      # name = "Papirus-Dark";
      # package = pkgs.catppuccin-papirus-folders.override {
      #   flavor = "mocha";
      #   accent = "teal";
      # };
    };

    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 20;
    };

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
  };

  qt = {
    enable = true;
    platformTheme = "gtk";
  };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };
}
