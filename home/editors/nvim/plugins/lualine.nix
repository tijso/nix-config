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
            }
          ];
          lualine_b = [
            {
              name = "branch";
            }
            {
              name = "diff";
            }
          ];
          lualine_c = [
            {
              name = "filename";
            }
          ];
          lualine_x = [
            {
              name = "diagnostics";
            }
            {
              name = "filetype";
            }
          ];
          lualine_y = ["progress"];
          lualine_z = [
            {
              name = "location";
            }
          ];
        };
      };
    };
  };
}
