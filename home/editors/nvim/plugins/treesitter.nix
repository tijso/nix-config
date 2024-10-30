{
  programs.nixvim.plugins = {
    treesitter = {
      enable   = true;
      nixvimInjections = true;
      nixGrammars = true;
      settings = {
        indent = {
          enable = true;
        };
        rainbow-delimiters = {
          enable = true;
        };
        hmts = {
          enable = true;
        };
        treesitter-context = {
          enable = true;
          settings = { max_lines = 2; };
        };
        incrementalSelection = {
          enable = true;
        };
        ensureInstalled = [
          "bash"
          "bibtex"
          "c"
          "css"
          "csv"
          "cpp"
          "dockerfile"
          "dot"
          "fish"
          "go"
          "html"
          "javascript"
          "jsdoc"
          "json"
          "julia"
          "latex"
          "llvm"
          "lua"
          "luadoc"
          "luap"
          "make"
          "markdown"
          "markdown_inline"
          "mlir"
          "nix"
          "python"
          "query"
          "regex"
          "rst"
          "rust"
          "ssh_config"
          "sql"
          "tsv"
          "tsx"
          "typescript"
          # "typst"
          "toml"
          "vim"
          "vimdoc"
          "yaml"
          "zig"
        ];
      };
    };
  };
}
