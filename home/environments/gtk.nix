{pkgs, ...}: {
  gtk = {
    enable = true;
    theme = {
    #   name = "Kanagawa-BL";
    #   package = pkgs.kanagawa-gtk-theme;
      name = "Catppuccin-Mocha-Compact-Teal-Dark";
    };
    iconTheme = {
       # name = "Tela-circle-dark";
       # package = pkgs.tela-circle-icon-theme;
       name = "Papirus-Dark";
       package = pkgs.catppuccin-papirus-folders.override {
         flavor = "mocha";
         accent = "teal";
      };
    };
    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
    };
    font = {
      name = "Monaspace Neon";
      size = 14;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
  };
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
}
