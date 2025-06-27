{
  config,
  lib,
  pkgs,
  ...
}:
with lib; {
  # This part is usually in your main home.nix, outside the specific nvf module
  # home.packages = with pkgs; [
  #   lazygit # <--- Ensure lazygit is added here!
  #   # ... other general packages ...
  # ];

  options.myHome.editors.nvf.enable = mkEnableOption "Enable Nvf";
  config = mkIf config.myHome.editors.nvf.enable {
    programs.nvf = {
      enable = true;
      settings.vim = {
        theme = {
          enable = true;
          # name = "solarized-osaka";
          name = "rose-pine";
          style = "main";
          transparent = true;
        };
        enableLuaLoader = true;
        lineNumberMode = "relNumber";
        lsp.enable = true;
        preventJunkFiles = true;
        viAlias = true;
        vimAlias = true;
        withNodeJs = true;
        options = {
          tabstop = 4;
          shiftwidth = 4;
          wrap = false;
          cursorline = true;
          expandtab = true;
          smartindent = true;
          incsearch = true;
          hlsearch = true;
          ignorecase = true;
          smartcase = true;
          termguicolors = true;
          background = "dark";
          cmdheight = 1;
          showmode = false;
          showcmd = false;
          scrolloff = 8;
          sidescrolloff = 8;
          swapfile = false;
          backup = false;
          undofile = true;
          updatetime = 300;
          wildmenu = true;
          wildmode = "list:longest,full";
          encoding = "utf-8";
          hidden = true;
          backspace = "indent,eol,start";
          splitright = true;
          splitbelow = true;
          inccommand = "split";
          signcolumn = "yes";
          fillchars = "vert:│";
          # foldmethod = "indent"; # Uncomment if you want code folding by indentation
          # foldlevel = 99; # Uncomment if you want all folds open by default
        };

        clipboard = {
          enable = true;
          registers = "unnamedplus";
          providers = {
            wl-copy.enable = true;
            xsel.enable = true;
          };
        };

        maps = {
          normal = {
          };
        };

        diagnostics = {
          enable = true;
          config = {
            virtual_lines.enable = true;
            underline = true;
          };
        };

        # AI INTEGRATIONS
        extraPlugins = {
          windsurf-vim = {
            package = pkgs.vimPlugins.windsurf-vim;
            setup = ''
              vim.g.codeium_disable_bindings = 1

              -- Custom Windsurf/Codeium keybindings
              vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
              vim.keymap.set('i', '<C-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
              vim.keymap.set('i', '<C-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
              vim.keymap.set('i', '<C-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
            '';
          };

          plenary-nvim = {
            package = pkgs.vimPlugins.plenary-nvim;
          };

          nui-nvim = {
            package = pkgs.vimPlugins.nui-nvim;
          };

          # toggleterm-nvim = {
          #   package = pkgs.vimPlugins.toggleterm-nvim;
          #   setup = "lua require('toggleterm').setup()"; # Default setup
          # };
          zen-mode-nvim = {
            package = pkgs.vimPlugins.zen-mode-nvim;
            enable = true;
          };
          flash-nvim = {
            package = pkgs.vimPlugins.flash-nvim;
            enable = true;
          };
          # mason-nvim = {
          #   package = pkgs.vimPlugins.mason-nvim;
          #   enable = true;
          # };
        };

        keymaps = [
          {
            key = "jk";
            mode = ["i"];
            action = "<ESC>";
            desc = "Exit insert mode";
          }
          {
            key = "<leader>nh";
            mode = ["n"];
            action = ":nohl<CR>";
            desc = "Clear search highlights";
          }
          {
            key = "<leader>ff";
            mode = ["n"];
            action = "<cmd>Telescope find_files<cr>";
            desc = "Search files by name";
          }
          {
            key = "<leader>lg";
            mode = ["n"];
            action = "<cmd>Telescope live_grep<cr>";
            desc = "Search files by contents";
          }
          {
            key = "<leader>fe";
            mode = ["n"];
            action = "<cmd>Neotree toggle<cr>";
            desc = "File browser toggle";
          }
          {
            key = "<C-h>";
            mode = ["i"];
            action = "<Left>";
            desc = "Move left in insert mode";
          }
          {
            key = "<C-j>";
            mode = ["i"];
            action = "<Down>";
            desc = "Move down in insert mode";
          }
          {
            key = "<C-k>";
            mode = ["i"];
            action = "<Up>";
            desc = "Move up in insert mode";
          }
          {
            key = "<C-l>";
            mode = ["i"];
            action = "<Right>";
            desc = "Move right in insert mode";
          }

          # AI KEYBINDINGS
          {
            key = "<leader>cd";
            mode = ["n"];
            action = "<cmd>Codeium disable<cr>";
            desc = "Disable Windsurf";
          }
          {
            key = "<leader>cs";
            mode = ["n"];
            action = "<cmd>Codeium enable<cr>";
            desc = "Enable Windsurf";
          }
          {
            key = "<leader>gg";
            mode = ["n"];
            # To use Toggleterm for floating LazyGit, uncomment the Toggleterm example in extraPlugins
            # and change this action:
            # action = ":lua require('toggleterm.terminal').Terminal:new({ cmd = 'lazygit', direction = 'float', hidden = true }):toggle()<CR>";
            action = "<cmd>split | terminal lazygit<cr>"; # Opens lazygit in a horizontal split
            desc = "Open LazyGit";
          }
        ];

        telescope.enable = true;

        spellcheck = {
          enable = true;
          languages = ["en"];
          programmingWordlist.enable = true;
        };

        lsp = {
          formatOnSave = true;
          lspkind.enable = false;
          lightbulb.enable = false;
          lspsaga.enable = false;
          trouble.enable = true;
          lspSignature.enable = true;
          otter-nvim.enable = false;
          nvim-docs-view.enable = false;
        };

        languages = {
          enableFormat = true;
          enableTreesitter = true;
          # treesitter.textobjects.enable = true;
          enableExtraDiagnostics = true;
          nix.enable = true;
          clang.enable = true;
          zig.enable = true;
          python.enable = true;
          markdown.enable = true;
          go = {
            enable = true;
            lsp.enable = true;
            format.type = "gofumpt";
            dap.enable = true;
          };
          ts = {
            enable = true;
            lsp.enable = true;
            format.type = "prettierd";
            extensions.ts-error-translator.enable = true;
          };
          html.enable = true;
          lua.enable = true;
          css.enable = false;
          typst.enable = true;
          rust = {
            enable = true;
            crates.enable = true;
          };
        };
        visuals = {
          nvim-web-devicons.enable = true;
          nvim-cursorline.enable = true;
          cinnamon-nvim.enable = true;
          fidget-nvim.enable = true;
          highlight-undo.enable = true;
          indent-blankline.enable = true;
          rainbow-delimiters.enable = true;
          motion = {
            hop.enable = false; # Set to false if using flash.nvim
            leap.enable = false; # Set to false if using flash.nvim
            precognition.enable = false;
          };
          images = {
            image-nvim.enable = false;
          };
        };

        statusline.lualine = {
          enable = true;
          theme = "auto";
        };

        autopairs.nvim-autopairs.enable = true;
        autocomplete.nvim-cmp.enable = true;
        snippets.luasnip.enable = true;
        tabline.nvimBufferline.enable = true;
        treesitter.context.enable = false;
        binds = {
          whichKey.enable = true;
          cheatsheet.enable = true;
        };
        git = {
          enable = true;
          gitsigns.enable = true;
          gitsigns.codeActions.enable = false;
          # fugitive.enable = true;
        };
        projects.project-nvim.enable = true;
        dashboard.dashboard-nvim.enable = true;
        filetree.neo-tree.enable = true;
        notify = {
          nvim-notify.enable = true;
          nvim-notify.setupOpts.background_colour = "#${config.lib.stylix.colors.base00}";
        };
        utility = {
          preview.markdownPreview.enable = true;
          ccc.enable = false;
          vim-wakatime.enable = false;
          icon-picker.enable = true;
          surround.enable = true;
          diffview-nvim.enable = true;
          # motion = { ... };
          images = {
            image-nvim.enable = false;
          };
        };
        ui = {
          borders.enable = true;
          noice.enable = true;
          colorizer.enable = true;
          illuminate.enable = true;
          breadcrumbs = {
            enable = false;
            navbuddy.enable = false;
          };
          smartcolumn = {
            enable = false;
          };
          fastaction.enable = true;
        };

        session = {
          nvim-session-manager.enable = false;
        };
        comments = {
          comment-nvim.enable = true;
        };
      };
    };
  };
}
