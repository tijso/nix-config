{
  programs.nixvim.plugins.alpha = {
    enable = true;
    # iconsEnabled = true;
    layout = [
      {
        type = "padding";
        val = 2;
      }
      {
        opts = {
          hl = "AlphaHeader";
          position = "center";
        };
        type = "text";
        val = [

        "   ███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗"
        "   ████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║"
        "   ██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║"
        "   ██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║"
        "   ██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║"
        "   ╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝"
        "                                               "
        "       git@github.com:tijso/nix-config.git     "
        ];
      }
      {
        type = "padding";
        val = 2;
      }
      {
        type = "button";
        val = "󰺄  > New File";
        on_press.raw = "require('telescope.builtin').find_files";
        opts = {
          # hl = "comment";
          keymap = [
            "n"
            "e"
            ":Telescope find_files <CR>"
            {
              noremap = true;
              silent = true;
              nowait = true;
            }
          ];
          shortcut = "e";

          position = "center";
          cursor = 3;
          width = 38;
          align_shortcut = "right";
          hl_shortcut = "Keyword";
        };
      }

      {
        type = "padding";
        val = 1;
      }
      {
        type = "button";
        val = "  > Find File";
        on_press.raw = "require('telescope.builtin').find_files";
        opts = {
          # hl = "comment";
          keymap = [
            "n"
            "f"
            ":Telescope find_files <CR>"
            {
              noremap = true;
              silent = true;
              nowait = true;
            }
          ];
          shortcut = "f";

          position = "center";
          cursor = 3;
          width = 38;
          align_shortcut = "right";
          hl_shortcut = "Keyword";
        };
      }

      {
        type = "padding";
        val = 1;
      }
      {
        type = "button";
        val = "  > Find Recent";
        on_press.raw = "require('telescope.builtin').find_files";
        opts = {
          # hl = "comment";
          keymap = [
            "n"
            "t"
            ":Telescope oldfiles <CR>"
            {
              noremap = true;
              silent = true;
              nowait = true;
            }
          ];
          shortcut = "t";

          position = "center";
          cursor = 3;
          width = 38;
          align_shortcut = "right";
          hl_shortcut = "Keyword";
        };
      }
      {
        type = "padding";
        val = 1;
      }
      {
        type = "button";
        val = " > Repos";
        on_press.raw = "require('telescope.builtin').find_files";
        opts = {
          # hl = "comment";
          keymap = [
            "n"
            "r"
            ":cd $HOME/repos | Telescope find_files<CR>"
            {
              noremap = true;
              silent = true;
              nowait = true;
            }
          ];
          shortcut = "r";

          position = "center";
          cursor = 3;
          width = 38;
          align_shortcut = "right";
          hl_shortcut = "Keyword";
        };
      }
      {
        type = "padding";
        val = 1;
      }
      {
        type = "button";
        val = "󰗼  > Quit NVIM";
        on_press.raw = "require('telescope.builtin').find_files";
        opts = {
          # hl = "comment";
          keymap = [
            "n"
            "q"
            ":qa<CR>"
            {
              noremap = true;
              silent = true;
              nowait = true;
            }
          ];
          shortcut = "q";

          position = "center";
          cursor = 3;
          width = 38;
          align_shortcut = "right";
          hl_shortcut = "Keyword";
        };
      }
      {
        type = "padding";
        val = 2;
      }
      {
        opts = {
          hl = "Keyword";
          position = "center";
        };
        type = "text";
        val = "Inspiring quote here.";
      }
    ];
  };
}
