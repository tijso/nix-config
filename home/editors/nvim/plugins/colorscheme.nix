{ pkgs, ...}:

{
  programs.nixvim = {
    colorschemes.kanagawa = {
      enable = false;
      settings = {
        # transparent = false;
        terminal_colors = true;
        compile = true;
        style = "wave";
        styles = {
          italic =true;
          bold = true;
          transparency = true;
        };
        # colors = {
        #   theme ={
        #     all = {
        #       ui ={
        #         bg_gutter = "none";
        #       };
        #     };
        #   };
        # };
      };
    };

    colorschemes.tokyonight = {
      enable = false;
      settings = {
        style = "night";
        terminal_colors = true;
        transparent = false;
        styles = {
          sidebars = "transparent";
          floats = "transparent";
        };
      };
    };

    colorschemes.rose-pine = {
      enable = false;
      settings = {
        variant = "main"; # "auto" "main", "moon", "dawn"
        dark_variant = "main"; # main", "moon", "dawn"
        styles = {
          bold = true;
          italic = true;
          transparency = true;
        };
      };
    };

    colorschemes.catppuccin = {
      enable = true;
      settings = {
        background = {
          light = "macchiato";
          dark = "mocha";
        };
        flavour = "mocha";
        disable_bold = false;
        disable_italic = false;
        disable_underline = false;
        transparent_background = true;
        term_colors = true;
        integrations = {
        cmp = true;
        noice = true;
        notify = true;
        harpoon = true;
        gitsigns = true;
        which_key = true;
        rainbow_delimiters = true;
        treesitter_context = true;
        telescope.enabled = true;
        treesitter = true;
        indent_blankline.enabled = true;
        native_lsp = {
          enabled = true;
          inlay_hints = {
            background = true;
          };
          underlines = {
            errors = ["underline"];
            hints = ["underline"];
            information = ["underline"];
            warnings = ["underline"];
          };
        };
      };
    };
  };

  extraPlugins = with pkgs.vimPlugins; [
    kanagawa-nvim
    tokyonight-nvim
  ];
};
}
