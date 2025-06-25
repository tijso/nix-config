{
  lib,
  pkgs,
  config,
  ...
}:
with lib; {
  options.myHome.theming.stylix.enable = mkEnableOption "Enable Stylix";
  config = mkIf config.myHome.theming.stylix.enable {
    stylix = {
      enable = true;
      autoEnable = true;
      polarity = "dark";
      image = ./wallpaper.png;
      base16Scheme = ./themes/rose-pine.yaml;

      opacity = {
        terminal = 0.9;
        applications = 1.0;
        popups = 0.8;
        desktop = 1.0;
      };

      targets = {
        gtk.enable = true;
        qt.enable = true;

        fuzzel.enable = true;
        waybar.enable = true;

        fish.enable = false;
        ghostty.enable = false;
        helix.enable = false;
        neovim.enable = false;
        starship.enable = false;
        wezterm.enable = false;
        nvf.enable = false;
      };

      cursor = {
        name = "Bibata-Modern-Ice";
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
          package = pkgs.maple-mono.NF;
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
          desktop = 11;
        };
      };
    };
  };
}
