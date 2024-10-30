{ pkgs, ...}:

{
  programs.nixvim = {
    plugins.telescope = {
      enable = true;
      extensions.fzf-native.enable = true;
      settings = {
        defaults = {
          layout_config = {
            horizontal = {
              prompt_position = "top";
              preview_width = 0.55;
              results_width = 0.8;
            };
            vertical = {
              mirror = false;
            };
            width = 0.87;
            height = 0.80;
            preview_cutoff = 120;
          };
          set_env.COLORTERM = "truecolor";
          prompt_prefix = "   ";
          selection_caret = "  ";
          entry_prefix = "  ";
          color_devicons = true;
          initial_mode = "insert";
          selection_strategy = "reset";
          sorting_strategy = "ascending";

          file_ignore_patterns = [
            "^node_modules/"
            "^.devenv/"
            "^.direnv/"
            "^.git/"
          ];
          borderchars = [
            "─"
            "│"
            "─"
            "│"
            "╭"
            "╮"
            "╯"
            "╰"
          ];
          border = {};
          layout_strategy = "horizontal";

          vimgrep_arguments = [
            "${pkgs.ripgrep}/bin/rg"
            "-L"
            "--color=never"
            "--no-heading"
            "--with-filename"
            "--line-number"
            "--column"
            "--smart-case"
            "--fixed-strings"
          ];
        };
      };

      keymaps = {
        "<leader>ff" = {
          action = "find_files";
          options.desc = "Telescope find files";
        };

        "<leader>fg" = {
          action = "live_grep";
          options.desc = "Telescope live grep";
        };

        "<leader>fs" = {
          action = "grep_string";
          options.desc = "Telescope grep string";
        };

        "<leader>fb" = {
          action = "buffers";
          options.desc = "Telescope find buffer";
        };

        "<leader>fr" = {
          action = "oldfiles";
          options.desc = "Telescope recent files";
        };

        "<leader>fh" = {
          action = "help_tags";
          options.desc = "Telescope help tags";
        };

        "<leader>fc" = {
          action = "command_history";
          options.desc = "Telescopw search command history";
        };

        "<leader>fp" = {
          action = "git_files";
          options.desc = "Telescope git files";
        };

        "<leader>fm" = {
          action = "man_pages";
          options.desc = "Telescope man pages";
        };
      };
    };
  };
}
