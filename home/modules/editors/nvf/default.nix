{
  config,
  lib,
  ...
}:
with lib;
{
  options.myHome.editors.nvf.enable = mkEnableOption "Enable nvf";
  config = mkIf config.myHome.editors.nvf.enable {
    programs.nvf = {
      enable = true;
      settings = {
        vim = {
          viAlias = true;
          vimAlias = true;
          theme = {
            enable = true;
            name = "catppuccin";
            style = "mocha";
          };
          lsp = {
            enable = true;
            formatOnSave = true;
          };
          treesitter = {
            enable = true;
            context.enable = true;
          };
          autocomplete = {
            nvim-cmp.enable = true;
          };
          filetree = {
            nvimTree = {
              enable = true;
            };
          };
          languages = {
            nix.enable = true;
            rust = {
              enable = true;
              crates.enable = true;
            };
            go = {
              enable = true;
              format.enable = true;
            };
            lua = {
              enable = true;
              lsp.enable = true;
            };
            css = {
              enable = true;
              format.enable = true;
            };
            html = {
              enable = true;
              # Remove format.enable = true; as it's not supported
            };
          };
          git = {
            enable = true;
            gitsigns.enable = true;
          };
          statusline = {
            lualine = {
              enable = true;
              theme = "catppuccin";
            };
          };
          telescope = {
            enable = true;
          };
          maps = {
            normal = {
              "<leader>e" = {
                action = ":NvimTreeToggle<CR>";
                desc = "Toggle file explorer";
              };
              "<leader>ff" = {
                action = ":Telescope find_files<CR>";
                desc = "Find files";
              };
              "<leader>fg" = {
                action = ":Telescope live_grep<CR>";
                desc = "Live grep";
              };
              "<leader>fb" = {
                action = ":Telescope buffers<CR>";
                desc = "Find buffers";
              };
            };
          };
        };
      };
    };
  };
}
