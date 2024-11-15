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
    environment.defaultPackages = with pkgs; [ xfce.thunar ];
    home.packages = with pkgs; [
      xfce.thunar-archive-plugin # Archive creation/extraction
      xfce.thunar-volman # Removable media management
      xfce.thunar-media-tags-plugin # Media file tagging
      # Additional dependencies for full functionality
      gnome.file-roller # Archive handling GUI
      ffmpegthumbnailer # Video thumbnails
      tumbler # Thumbnail service
      gvfs # Virtual filesystem support
      libgsf # ODF thumbnails
      poppler_utils # PDF thumbnails
    ];

    # Default applications for common file types
    xdg.mimeApps.defaultApplications = {
      "inode/directory" = [ "thunar.desktop" ];
      "application/x-gnome-saved-search" = [ "thunar.desktop" ];
    };

    # Thunar settings via xfconf
    xdg.configFile."xfce4/xfconf/xfce-perchannel-xml/thunar.xml".text = ''
      <?xml version="1.0" encoding="UTF-8"?>
      <channel name="thunar" version="1.0">
        <property name="default-view" type="string" value="ThunarDetailsView"/>
        <property name="last-details-view-column-widths" type="string" value="THUNAR_COLUMN_DATE_MODIFIED:200,THUNAR_COLUMN_NAME:300,THUNAR_COLUMN_SIZE:100,THUNAR_COLUMN_TYPE:200"/>
        <property name="misc-date-style" type="string" value="THUNAR_DATE_STYLE_SHORT"/>
        <property name="misc-folders-first" type="bool" value="true"/>
        <property name="misc-text-beside-icons" type="bool" value="false"/>
        <property name="misc-single-click" type="bool" value="false"/>
        <property name="misc-thumbnail-mode" type="string" value="THUNAR_THUMBNAIL_MODE_ALWAYS"/>
        <property name="misc-thumbnail-draw-frames" type="bool" value="true"/>
        <property name="misc-thumbnail-size" type="uint" value="128"/>
        <property name="misc-volume-management" type="bool" value="true"/>
        <property name="misc-automount" type="bool" value="true"/>
        <property name="misc-automount-drives" type="bool" value="true"/>
        <property name="misc-autoopen-new-volumes" type="bool" value="true"/>
      </channel>
    '';
  };
}
