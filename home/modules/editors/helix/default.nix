{
  config,
  lib,
  ...
}:
with lib;

{
  options.myHome.editors.helix.enable = mkEnableOption "Enable Helix";
  config = mkIf config.myHome.editors.helix.enable {
    programs.helix = {
      enable = true;
      settings = {
        theme = "catppuccin_mocha";
        editor = {
          line-number = "relative";
          soft-wrap.enable = true;
          mouse = false;
          indent-guides = {
            render = true;
            character = "▏"; # Some characters that work well: "▏", "┆", "┊", "⸽"
            skip-levels = 1;
          };
          color-modes = true;
          true-color = true;
          cursorline = true;
          auto-save = true;
          bufferline = "multiple";
          cursor-shape = {
            normal = "block";
            insert = "bar";
            select = "underline";
          };
          lsp.display-inlay-hints = true;
          statusline = {
            separator = "|";
            mode.normal = "NORMAL";
            mode.insert = "INSERT";
            mode.select = "SELECT";
            left = [
              "mode"
              "version-control"
              "spinner"
              "file-modification-indicator"
            ];
            center = [
              "file-name"
            ];
            right = [
              "diagnostics"
              "file-encoding"
              "file-line-ending"
              "file-type"
              "selections"
              "position"
            ];
          };
        };
        keys.normal = {
          esc = [
            "collapse_selection"
            "keep_primary_selection"
          ];
          C-j = [
            "extend_to_line_bounds"
            "delete_selection"
            "paste_after"
          ];
          C-k = [
            "extend_to_line_bounds"
            "delete_selection"
            "move_line_up"
            "paste_before"
          ];
        };
      };

      languages.languages = [
        {
          name = "nix";
          auto-format = true;
          language-server = {
            command = "rnix-lsp";
          };
          formatter = {
            command = "nixfmt";
          };
        }

        {
          name = "html";
          auto-format = true;
        }

        {
          name = "css";
          auto-format = true;
        }

        {
          name = "javascript";
          auto-format = true;
        }

        {
          name = "typescript";
          auto-format = true;
        }

        {
          name = "rust";
          auto-format = true;
          config.rust-analyzer = {
            cargo.buildScripts.enable = true;
            checkOnSave.command = "clippy";
            procMacro.enable = true;
          };
        }
      ];
    };
  };
}
