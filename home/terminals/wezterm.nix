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
        -- color_scheme = "Tokyo Night",
        -- color_scheme = "rose-pine",
        -- color_scheme = "Kanagawa (Gogh)",
        -- font = wezterm.font "Fira Code",
        -- my coolnight colorscheme:
        config.colors = {
        	foreground = "#CBE0F0",
        	background = "#011423",
        	cursor_bg = "#47FF9C",
        	cursor_border = "#47FF9C",
        	cursor_fg = "#011423",
        	selection_bg = "#033259",
        	selection_fg = "#CBE0F0",
        	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
        	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
        },
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
        font_size = 18.0,
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
