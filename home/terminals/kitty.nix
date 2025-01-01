{
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.modules.terminals.kitty;
in
{
  options.modules.terminals.kitty.enable = mkEnableOption "Enable Kitty";
  config = mkIf cfg.enable {
    programs.kitty = {
      enable = true;
      themeFile = "Catppuccin-Mocha";
      # themeFile = "Nightfly";
      # themeFile = "Kanagawa";
      font = {
        name = "Fira Code";
        # name = "Iosevka";
        size = 15;
      };
      settings = {
        enable_audio_bell = false;
        window_padding_width = 17;
        hide_window_decorations = false;
        cursor_shape = "beam";
        background_opacity = "0.95";
        tab_bar_style = "powerline";
        tab_bar_edge = "bottom";
        close_on_child_death = false;
      };
    };
  };
}
