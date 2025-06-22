{
  lib,
  pkgs,
  config,
  ...
}:
with lib;
{
  options.myHome.modules.stylix.enable = mkEnableOption "Enable Stylix";
  config = mkIf config.myHome.modules.stylix.enable {
    stylix = {
      enable = true;
      polarity = "dark";
      image = ./Wallpapers/Tunnel.png;
      base16Scheme = "./themes/rose-pine.yaml";

      opacity = {
        terminal = 0.9;
        applications = 1.0;
        popups = 0.8;
        desktop = 1.0;
      };

      targets = {
        fuzzel.enable = true;
        ghostty.enable = false;
        gtk.enable = true;
        neovim.enable = false;
        qt.enable = true;
        waybar.enable = true;
      };

      cursor = {
        name = "Bibata-Modern-Classic";
        package = pkgs.bibata-cursors;
        size = 24;
      };

      fonts = {
        serif = {
          name = "Source Serif";
          package = pkgs.source-serif;
        };
        sansSerif = {
          name = "Noto Sans";
          package = pkgs.noto-fonts;
        };
        monospace = {
          package = pkgs.maple-mono-NF;
          name = "Maple Mono NF";
        };
        emoji = {
          package = pkgs.noto-fonts-emoji;
          name = "Noto Color Emoji";
        };
        sizes = {
          terminal = 14;
          applications = 12;
          popups = 12;
        };
      };
    };
  };
}
