{
  pkgs,
  ...
}:
{
  programs.bat = {
    enable = true;
    catppuccin.enable = true;
    config = {
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
