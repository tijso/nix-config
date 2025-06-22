{
  pkgs,
  lib,
  config,
  ...
}:
with lib;

{
  options.myHome.modules.theming.gtk.enable = mkEnableOption "Enable Gtk";
  config = mkIf config.myHome.modules.theming.gtk.enable {
    gtk = {
      iconTheme = {
        name = "Fluent-teal-dark";
        package = pkgs.fluent-icon-theme.override { colorVariants = [ "teal" ]; };
        # name = "Papirus-Dark";
        # package = pkgs.papirus-icon-theme;
        # package = pkgs.catppuccin-papirus-folders.override {
        #   flavor = "mocha";
        #   accent = "teal";
        # };
      };
    };

    qt = {
      enable = true;
      platformTheme.name = "gtk";
      style.name = "gtk2";
    };

    dconf = {
      enable = true;
      settings = {
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
          clock-show-seconds = false;
          clock-show-weekday = true;
          enable-animations = true;
          gtk-enable-primary-paste = true;
        };

        "org/gtk/settings/file-chooser" = {
          clock-format = "24h";
          date-format = "regular";
          location-mode = "path-bar";
          show-hidden = false;
          show-size-column = true;
          show-type-column = true;
          sidebar-width = 170;
          sort-column = "name";
          sort-directories-first = true;
          sort-order = "ascending";
          type-format = "category";
        };

        "org/gnome/desktop/wm/preferences" = {
          button-layout = "appmenu:minimize,maximize,close";
          focus-mode = "click";
          resize-with-right-button = true;
        };
      };
    };
  };
}
