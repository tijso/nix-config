{
  programs.nixvim = {
    plugins.lualine = {
      enable = true;
      settings = {
        globalstatus = true;
        theme = "auto";
        componentSeparators = {
          left = "|";
          right = "|";
        };
        sectionSeparators = {
          # left = "";
          # right = "";
          left = "";
          right = "";
        };
        sections = {
          lualine_a = [
            {
              name = "mode";
              separator = {
                # left = "";
                # right = "";
                # left = "";
                # right = "";
              };
            }
          ];
          lualine_b = [
            {
              name = "branch";
              padding = {
                left = 2;
                right = 0;
              };
              icon = "";
              colored = true;
            }
            {
              name = "diff";
              colored = true;
              symbols = {
                added = " ";
                modified = " ";
                removed = " ";
              };
            }
          ];
          lualine_c = [
            {
              name = "filename";
              colored = true;
            }
          ];
          lualine_x = [
            {
              name = "diagnostics";
              color = {
                fg = "#605f6f";
                bg = "#232232";
              };
              diagnostics_color = {
                color_error = {fg = "#F38BA8";};
                color_warn = {fg = "#FAE3B0";};
              };
              symbols = {
                error = " ";
                warn = " ";
              };
            }
            {
              name = "filetype";
              colored = true;
              padding = {
                left = 1;
                right = 2;
              };
            }
          ];
          lualine_y = ["progress"];
          lualine_z = [
            {
              name = "location";
              separator = {
                # right = "";
                # right = "";
                # left = "";
                # left = "";
              };
            }
          ];
        };
      };
    };
  };
}
