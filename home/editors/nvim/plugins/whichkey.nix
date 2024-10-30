{
  programs.nixvim = {
    plugins.which-key = {
      enable = true;
      settings = {
        icons = {
          breadcrumb = "»";
          group = "+";
          separator = ""; # ➜
        };
        registrations = {
          "<leader>f" = "+file/find";
        };
      };
    };
  };
}
