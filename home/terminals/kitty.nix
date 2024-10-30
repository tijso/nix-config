{pkgs, config, ... }:

{
  programs.kitty = {
    enable = true;
    catppuccin.enable = true;
    # theme = "Nightfly";
    # theme = "Kanagawa";
    font = {
      name = "Fira Code";
      # name = "Iosevka";
      size = 16;
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
}
