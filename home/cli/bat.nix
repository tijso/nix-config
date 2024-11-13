{
  pkgs,
  ...
}:
{
  programs.bat = {
    enable = true;
    config = {
      catppuccin.enable = true;
      style = "numbers,changes,header";
      paging = "auto";
      wrap = "never";
      tabs = "4";
      extraPackages = with pkgs.bat-extras; [
        batdiff
        batgrep
        prettybat
      ];
    };
  };
}
