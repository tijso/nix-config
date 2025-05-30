{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.modules.terminals.ghostty;
in
{
  options.modules.terminals.ghostty.enable = mkEnableOption "Enable Ghostty";
  config = mkIf cfg.enable {
    programs.ghostty = {
      enable = true;
      package = pkgs.ghostty;
    };
    home.file."./.config/ghostty/config".text = ''
      # Carbonfox
      # background = #161616
      # foreground = #f2f4f8
      # selection-background = #2a2a2a
      # selection-foreground = #f2f4f8
      # cursor-color = #f2f4f8

      # palette = 0=#282828
      # palette = 1=#ee5396
      # palette = 2=#25be6a
      # palette = 3=#08bdba
      # palette = 4=#78a9ff
      # palette = 5=#be95ff
      # palette = 6=#33b1ff
      # palette = 7=#dfdfe0

      # palette = 8=#484848
      # palette = 9=#f16da6
      # palette = 10=#46c880
      # palette = 11=#2dc7c4
      # palette = 12=#8cb6ff
      # palette = 13=#c8a5ff
      # palette = 14=#52bdff
      # palette = 15=#e4e4e5

      # extended colors
      # palette = 16=#3ddbd9

      # Nightfly
      background = #011627
      foreground = #bdc1c6
      selection-background = #b2ceee
      selection-foreground = #080808
      cursor-color = #9ca1aa

      palette = 0=#1d3b53
      palette = 1=#fc514e
      palette = 2=#a1cd5e
      palette = 3=#e3d18a
      palette = 4=#82aaff
      palette = 5=#c792ea
      palette = 6=#7fdbca
      palette = 7=#a1aab8

      palette = 8=#7c8f8f
      palette = 9=#ff5874
      palette = 10=#21c7a8
      palette = 11=#ecc48d
      palette = 12=#82aaff
      palette = 13=#ae81ff
      palette = 14=#7fdbca
      palette = 15=#d6deeb

      # Tokyonight_Moon
      # background = #222436
      # foreground = #c8d3f5
      # cursor-color = #c8d3f5
      # selection-background = #2d3f76
      # selection-foreground = #c8d3f5

      # palette = 0=#1b1d2b
      # palette = 1=#ff757f
      # palette = 2=#c3e88d
      # palette = 3=#ffc777
      # palette = 4=#82aaff
      # palette = 5=#c099ff
      # palette = 6=#86e1fc
      # palette = 7=#828bb8
      # palette = 8=#444a73
      # palette = 9=#ff8d94
      # palette = 10=#c7fb6d
      # palette = 11=#ffd8ab
      # palette = 12=#9ab8ff
      # palette = 13=#caabff
      # palette = 14=#b2ebff
      # palette = 15=#c8d3f5

      # Font
      font-size = 18
      font-family = Maple Mono NF 
      font-family-bold = Maple Mono NF Bold
      font-family-bold-italic = Maple Mono NF Bold Italic
      font-family-italic = Maple Mono NF Italic

      # Window Settings 
      window-decoration = true
      window-height = 32
      window-width = 110
      adjust-cell-height = 10%

      # Transparency
      background-opacity = 0.95
      background-blur-radius = 60

      # Cursor Style
      cursor-style = bar
      cursor-style-blink = true
      mouse-hide-while-typing = true

      # Clipboard Settings
      clipboard-read = allow
      clipboard-write = allow
      clipboard-paste-protection = false
      #copy-on-select = clipboard

      # Misc
      scrollback-limit = 100_000
      wait-after-command = false
      window-save-state = always

      gtk-single-instance = true
      gtk-tabs-location = hidden

      unfocused-split-opacity = 0.5
      quick-terminal-position = center

      shell-integration = detect
      shell-integration-features = no-cursor,sudo

      # Keybindings
      keybind = alt+s>r=reload_config
      keybind = alt+s>x=close_surface
      keybind = alt+s>n=new_window

      # tabs
      keybind = alt+s>c=new_tab
      keybind = alt+s>shift+l=next_tab
      keybind = alt+s>shift+h=previous_tab
      keybind = alt+s>comma=move_tab:-1
      keybind = alt+s>period=move_tab:1

      # quick tab switch
      keybind = alt+s>1=goto_tab:1
      keybind = alt+s>2=goto_tab:2
      keybind = alt+s>3=goto_tab:3
      keybind = alt+s>4=goto_tab:4
      keybind = alt+s>5=goto_tab:5
      keybind = alt+s>6=goto_tab:6
      keybind = alt+s>7=goto_tab:7
      keybind = alt+s>8=goto_tab:8
      keybind = alt+s>9=goto_tab:9

      # split
      keybind = ctrl+shift+h=new_split:left
      keybind = ctrl+shift+j=new_split:down
      keybind = ctrl+shift+k=new_split:up
      keybind = ctrl+shift+l=new_split:right

      keybind = alt+super+h=goto_split:left
      keybind = alt+super+j=goto_split:bottom
      keybind = alt+super+k=goto_split:top
      keybind = alt+super+l=goto_split:right

      keybind = alt+s>z=toggle_split_zoom
      keybind = alt+s>e=equalize_splits
    '';
  };
}
