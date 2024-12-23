{
  pkgs,
  ...
}:
{
  gtk = {
    enable = true;

    theme = {
      name = "Tokyonight-Dark";
      package = pkgs.tokyonight-gtk-theme.override {
        themeVariants = [ "default" ];
        tweakVariants = [
          "outline"
          "float"
        ];
      };
      # name = "Catppuccin-Mocha-Standard-Teal-Dark";
      # package = pkgs.catppuccin-gtk.override {
      #   accents = ["teal"];
      #   size = "standard";
      #   tweaks = ["normal"];
      #   variant = "mocha";
      # };
    };

    iconTheme = {
      name = "Papirus-Dark";
      # package = pkgs.papirus-icon-theme;
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "teal";
      };
    };

    cursorTheme = {
      # name = "Bibata-Modern-Ice";
      # package = pkgs.bibata-cursors;
      name = "Yaru";
      package = pkgs.yaru-theme;
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
    platformTheme.name = "gtk";
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
