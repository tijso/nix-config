{
  pkgs,
  ...
}:
{
  programs.bat = {
    enable = true;
    catppuccin.enable = true;
    style = "numbers,changes,header";
    wrap = "never";
    tabs = "4";
    extraPackages = with pkgs.bat-extras; [
      batdiff
      batgrep
      prettybat
    ];
  };
}
