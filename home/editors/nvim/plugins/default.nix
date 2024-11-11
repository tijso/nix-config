{ pkgs, config, ... }:

{
  imports = [
    # ./lualine.nix
    ./treesitter.nix
    ./indent-blankline.nix
    ./colorscheme.nix
    ./telescope.nix
    ./noice.nix
    ./startify.nix
    ./harpoon.nix
    ./neo-tree.nix
    ./whichkey.nix
    # ./oil.nix
    # ./fzf.nix
  ];

   programs.nixvim = {
    plugins = {
      gitsigns = {
        enable = true;
        settings.signs = {
          add.text = "+";
          change.text = "~";
        };
      };
      trim = {
        enable = true;
        settings = {
          highlight = true;
          ft_blocklist = [
            "lspinfo"
            "floaterm"
          ];
        };
      };
      nvim-autopairs.enable = true;
      nix.enable = true;
      nvim-colorizer.enable = true;
    };
    extraPlugins = with pkgs.vimPlugins; [
      nvim-web-devicons
    ];
  };
}
