{ ... }:

{
  programs.nixvim = {
    autoCmd = [
      # Hightlight Text On Yank
      {
        event = "TextYankPost";
        pattern = "*";
        callback = { __raw = "function() vim.highlight.on_yank { higroup = 'IncSearch', timeout = 500 } end"; };
      }

      # Automatically trim all whitespace an save
      {
        event = ["BufWritePre"];
        pattern = ["*"];
        command = ":%s/\\s\\+$//e";
      }
    ];
  };
}
