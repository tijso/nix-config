{
  pkgs,
  config,
  inputs,
  ...
}: {
  imports = [
    inputs.nix-colors.homeManagerModules.default
  ];

  # ColorScheme
  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;

  home.pointerCursor = {
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
    size = 20;
  };

  gtk = {
    enable = true;
    font = {
      name = "DejaVu Sans";
      size = 12;
    };

    iconTheme = {
      # name = "Kanagawa";
      # package = pkgs.kanagawa-icon-theme;
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "lavender";
      };
    };

    theme = {
      # name = "Kanagawa-BL";
      # package = pkgs.kanagawa-gtk-theme;
      name = "Catppuccin-Mocha-Compact-Lavender-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = ["lavender"];
        size = "compact";
        # tweaks  = [ "rimless" ];
        variant = "mocha";
      };
    };

    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 20;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
  };
}
