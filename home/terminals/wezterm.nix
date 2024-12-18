{
  pkgs,
  config,
  ...
}:
{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      return {
        -- color_scheme = "Catppuccin Mocha",
        color_scheme = "Tokyo Night",
        -- color_scheme = "rose-pine",
        -- color_scheme = "Kanagawa (Gogh)",
        -- font = wezterm.font "Fira Code",
        font = wezterm.font "Maple Mono",
        -- font = wezterm.font "Monaspace Radon",
        --font_rules = {
        --{
        --intensity = "Bold",
        --italic = true,
        --font = wezterm.font({ family = "Maple Mono", weight = "Bold", style = "Italic" }),
        --},
        --{
        --italic = true,
        --intensity = "Half",
        --font = wezterm.font({ family = "Maple Mono", weight = "DemiBold", style = "Italic" }),
        --},
        --{
        --italic = true,
        --intensity = "Normal",
        --font = wezterm.font({ family = "Maple Mono", style = "Italic" }),
        --},
        --},
        font_size = 16.0,
        window_background_opacity = .95,
        window_close_confirmation = "NeverPrompt",
        use_fancy_tab_bar = true,
        hide_tab_bar_if_only_one_tab = true,
        enable_tab_bar = false,
        front_end = "WebGpu",
        enable_wayland = false,
        audible_bell = Disabled,
        default_cursor_style = "SteadyBar",
        window_padding = {
          left = 15,
          right = 15,
          top = 2,
          bottom = 2,
          },
      }
    '';
  };
}
