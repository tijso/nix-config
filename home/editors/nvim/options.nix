{

  programs.nixvim = {
    globals = {
      mapleader = " ";
    };

    clipboard      = {
        register = "unnamedplus";
        providers.wl-copy.enable = true;
      };

    opts = {
      termguicolors  = true;
      fileencoding   = "utf-8";
      updatetime     = 100;

      scrolloff      = 8;
      swapfile       = false;

      hlsearch       = false;
      incsearch      = true;
      inccommand     = "split";
      ignorecase     = true;
      smartcase      = true;

      spell          = true;
      spelllang      = "en_us";

      laststatus     = 3;
      showmode       = false;
      wrap           = false;

      shiftwidth     = 4;
      tabstop        = 4;
      softtabstop    = 4;
      expandtab      = true;
      smartindent    = true;
      autoindent     = true;

      cursorline     = true;
      number         = true;
      relativenumber = true;
      numberwidth    = 2;
      ruler          = false;

      splitbelow     = true;
      splitright     = true;
      undofile       = true;
      undolevels     = 10000;

      signcolumn     = "yes";
      cmdheight      = 2;

      foldlevel      = 99;
      foldlevelstart = 99;
      foldenable     = true;
    };
  };
}
