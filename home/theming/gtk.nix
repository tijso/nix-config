{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.modules.theming.gtk;
in
{
  options.modules.theming.gtk.enable = mkEnableOption "Enable Gtk";
  config = mkIf cfg.enable {
    gtk = {
      enable = true;
      theme = {
        name = "Rose-Pine";
        package = pkgs.rose-pine-gtk-theme;
        # name = "Kanagawa-BL-GS";
        # package = pkgs.kanagawa-gtk-theme;
        # name = "Tokyonight-Dark-BL";
        # package = pkgs.tokyonight-gtk-theme.override {
        #   themeVariants = [ "teal" ];
        #   tweakVariants = [
        #     "outline"
        #     "float"
        #   ];
        # };
      };

      iconTheme = {
        name = "Fluent-teal-dark";
        package = pkgs.fluent-icon-theme.override { colorVariants = [ "teal" ]; };
        # name = "Fluent-teal-dark";
        # package = pkgs.fluent-icon-theme.override { colorVariants = [ "teal" ]; };
        # name = "Papirus-Dark";
        # package = pkgs.papirus-icon-theme;
        # package = pkgs.catppuccin-papirus-folders.override {
        #   flavor = "mocha";
        #   accent = "teal";
        # };
      };

      cursorTheme = {
        name = "Rose-Pine";
        package = pkgs.rose-pine-cursor;
        # name = "Bibata-Modern-Ice";
        # package = pkgs.bibata-cursors;
        size = 24;
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
  };
}
