{
  lib,
  pkgs,
  config,
  inputs,
  ...
}:
with lib;
let
  cfg = config.theming.stylix;
in
{
  imports = with inputs; [
    stylix.homeManagerModules.stylix
  ];

  options.theming.stylix = {
    enable = lib.mkEnableOption "Enable Stylix";
  };

  config = lib.mkIf cfg.enable {
    stylix = {
      enable = true;
      polarity = "dark";
      image = ./Wallpapers/castle-landscape.jpg;

      base16Scheme = "./themes/rose-pine.yaml";
      # base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
      # base16Scheme = {
      #   system = "base16";
      #   name = "Rosé Pine";
      #   author = "Emilia Dunfelt <edun@dunfelt.se>";
      #   slug = "rose-pine";
      #   variant = "dark";
      #   palette = {
      #     base00 = "191724";
      #     base01 = "1f1d2e";
      #     base02 = "26233a";
      #     base03 = "6e6a86";
      #     base04 = "908caa";
      #     base05 = "e0def4";
      #     base06 = "e0def4";
      #     base07 = "524f67";
      #     base08 = "eb6f92";
      #     base09 = "f6c177";
      #     base0A = "ebbcba";
      #     base0B = "31748f";
      #     base0C = "9ccfd8";
      #     base0D = "c4a7e7";
      #     base0E = "f6c177";
      #     base0F = "524f67";
      #   };
      };

      opacity = {
        terminal = opacity;
        popups = opacity;
      };

      cursor = {
        name = "Bibata-Modern-Classic";
        package = pkgs.bibata-cursors;
        size = 24;
      };

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

      fonts = {
        sizes = {
          terminal = 14;
          applications = 12;
          popups = 12;
        };
      };
    };
  };
}
