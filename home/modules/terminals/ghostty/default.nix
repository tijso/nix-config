{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
with lib; {
  options.myHome.terminals.ghostty.enable = mkEnableOption "Enable Ghostty";
  config = mkIf config.myHome.terminals.ghostty.enable {
    programs.ghostty = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
      package = inputs.ghostty.packages.${pkgs.stdenv.hostPlatform.system}.default;
      settings = {
        font-family = "Maple Mono NF";
        font-family-bold = "Maple Mono NF Bold";
        font-family-bold-italic = "Maple Mono NF Bold Italic";
        font-family-italic = "Maple Mono NF Italic";
        font-size = 18;

        window-decoration = true;
        window-height = 32;
        window-width = 110;

        background-opacity = 0.95;
        background-blur-radius = 60;
        unfocused-split-opacity = 0.9;

        # Clipboard
        clipboard-paste-protection = false;
        copy-on-select = "clipboard";

        # Misc
        gtk-single-instance = true;
        shell-integration-features = "no-cursor";
        cursor-style = "bar";
        mouse-hide-while-typing = true;
        mouse-scroll-multiplier = 2;
        confirm-close-surface = false;
        keybind = [
          "alt+shift+r=reload_config"
          "alt+shift+x=close_surface"
          "alt+s>n=new_window"

          # Navigation
          "ctrl+shift+h=new_split:left"
          "ctrl+shift+j=new_split:down"
          "ctrl+shift+k=new_split:up"
          "ctrl+shift+l=new_split:right"

          "ctrl+alt+h=goto_split:left"
          "ctrl+alt+j=goto_split:down"
          "ctrl+alt+k=goto_split:up"
          "ctrl+alt+l=goto_split:right"
          "ctrl+shift+w=close_split"

          "ctrl+shift+z=toggle_split_zoom"
          "ctrl+shift+up=resize_split:up,10"
          "ctrl+shift+down=resize_split:down,10"
          "ctrl+shift+left=resize_split:left,10"
          "ctrl+shift+right=resize_split:right,10"
          "ctrl+shift+0=equalize_splits"

          # Tabs
          "ctrl+alt+n=next_tab"
          "ctrl+alt+[=previous_tab"
          "ctrl+alt+]=next_tab"
          "alt+s>1=goto_tab:1"
          "alt+s>2=goto_tab:2"
          "alt+s>3=goto_tab:3"
          "alt+s>4=goto_tab:4"
          "alt+s>5=goto_tab:5"
          "alt+s>6=goto_tab:6"
          "alt+s>7=goto_tab:7"
          "alt+s>8=goto_tab:8"
          "alt+s>9=goto_tab:9"
        ];
        theme = "rose-pine";
      };
      themes = {
        Nightfly = {
          background = "011627";
          foreground = "bdc1c6";
          selection-background = "b2ceee";
          selection-foreground = "080808";
          cursor-color = "9ca1aa";
          palette = [
            "0=#1d3b53"
            "1=#fc514e"
            "2=#a1cd5e"
            "3=#e3d18a"
            "4=#82aaff"
            "5=#c792ea"
            "6=#7fdbca"
            "7=#a1aab8"

            "8=#7c8f8f"
            "9=#ff5874"
            "10=#21c7a8"
            "11=#ecc48d"
            "12=#82aaff"
            "13=#ae81ff"
            "14=#7fdbca"
            "15=#d6deeb"
          ];
        };
        Moonfly = {
          background = "080808";
          foreground = "bdbdbd";
          selection-background = "b2ceee";
          selection-foreground = "080808";
          cursor-color = "8e8e8e";
          palette = [
            "0=#323437"
            "1=#ff5d5d"
            "2=#8cc85f"
            "3=#e3c78a"
            "4=#80a0ff"
            "5=#cf87e8"
            "6=#79dac8"
            "7=#c6c6c6"

            "8=#949494"
            "9=#ff5189"
            "10=#36c692"
            "11=#c6c684"
            "12=#74b2ff"
            "13=#ae81ff"
            "14=#85dc85"
            "15=#e4e4e4"
          ];
        };
        Tokyonight_Moon = {
          background = "222436";
          foreground = "c8d3f5";
          cursor-color = "c8d3f5";
          selection-background = "2d3f76";
          selection-foreground = "c8d3f5";
          palette = [
            "0=#1b1d2b"
            "1=#ff757f"
            "2=#c3e88d"
            "3=#ffc777"
            "4=#82aaff"
            "5=#c099ff"
            "6=#86e1fc"
            "7=#828bb8"
            "8=#444a73"
            "9=#ff8d94"
            "10=#c7fb6d"
            "11=#ffd8ab"
            "12=#9ab8ff"
            "13=#caabff"
            "14=#b2ebff"
            "15=#c8d3f5"
          ];
        };
        Coolnight = {
          background = "011423";
          foreground = "cbe0f0";
          cursor-color = "47ff9c";
          cursor-text = "011423";
          palette = [
            "0=#214969"
            "1=#e52e2e"
            "2=#44ffb1"
            "3=#ffe073"
            "4=#0fc5ed"
            "5=#a277ff"
            "6=#24eaf7"
            "7=#24eaf7"
            "8=#214969"
            "9=#e52e2e"
            "10=#44ffb1"
            "11=#ffe073"
            "12=#a277ff"
            "13=#a277ff"
            "14=#24eaf7"
            "15=#24eaf7"
          ];
        };
        Kanagawa-wave = {
          background = "1f1f28";
          foreground = "dcd7ba";
          cursor-color = "c8c093";
          selection-background = "2d4f67";
          selection-foreground = "c8c093";
          palette = [
            "0=#16161d"
            "1=#c34043"
            "2=#76946a"
            "3=#c0a36e"
            "4=#7e9cd8"
            "5=#957fb8"
            "6=#6a9589"
            "7=#c8c093"
            "8=#727169"
            "9=#e82424"
            "10=#98bb6c"
            "11=#e6c384"
            "12=#7fb4ca"
            "13=#938aa9"
            "14=#7aa89f"
            "15=#dcd7ba"
          ];
        };
        Carbonfox = {
          background = "161616";
          foreground = "f2f4f8";
          selection-background = "2a2a2a";
          selection-foreground = "f2f4f8";
          cursor-color = "f2f4f8";
          palette = [
            "0=#282828"
            "1=#ee5396"
            "2=#25be6a"
            "3=#08bdba"
            "4=#78a9ff"
            "5=#be95ff"
            "6=#33b1ff"
            "7=#dfdfe0"
            "8=#484848"
            "9=#f16da6"
            "10=#46c880"
            "11=#2dc7c4"
            "12=#8cb6ff"
            "13=#c8a5ff"
            "14=#52bdff"
            "15=#e4e4e5"
            "16=#3ddbd9"
          ];
        };
      };
    };
  };
}
