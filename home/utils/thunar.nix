{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
{
  options.thunar.enable = mkEnableOption "thunar file manager configuration";

  config = mkIf config.thunar.enable {
    home.packages = with pkgs; [
      thunar
      thunar-archive-plugin # Archive creation/extraction
      thunar-volman # Removable media management
      thunar-media-tags-plugin # Media file tagging

      # Additional dependencies for full functionality
      gnome.file-roller # Archive handling GUI
      ffmpegthumbnailer # Video thumbnails
      tumbler # Thumbnail service
      gvfs # Virtual filesystem support
      libgsf # ODF thumbnails
      poppler_utils # PDF thumbnails
    ];

    # Thunar configuration
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
        thunar-media-tags-plugin
      ];
    };

    # Default applications for common file types
    xdg.mimeApps.defaultApplications = {
      "inode/directory" = [ "thunar.desktop" ];
      "application/x-gnome-saved-search" = [ "thunar.desktop" ];
    };

    # Thunar settings
    xfconf.settings = {
      thunar = {
        # View settings
        "default-view" = "ThunarDetailsView";
        "last-details-view-column-widths" = {
          "THUNAR_COLUMN_DATE_MODIFIED" = 200;
          "THUNAR_COLUMN_NAME" = 300;
          "THUNAR_COLUMN_SIZE" = 100;
          "THUNAR_COLUMN_TYPE" = 200;
        };

        # Behavior settings
        "misc-date-style" = "THUNAR_DATE_STYLE_SHORT";
        "misc-folders-first" = true;
        "misc-text-beside-icons" = false;
        "misc-single-click" = false;

        # Performance settings
        "misc-thumbnail-mode" = "THUNAR_THUMBNAIL_MODE_ALWAYS";
        "misc-thumbnail-draw-frames" = true;
        "misc-thumbnail-size" = 128;

        # Volume management
        "misc-volume-management" = true;
        "misc-automount" = true;
        "misc-automount-drives" = true;
        "misc-autoopen-new-volumes" = true;
      };
    };
  };
}
