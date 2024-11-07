{
  pkgs,
  config,
  ...
}: {
  programs.bat = {
    enable = true;
    catppuccin.enable = true;
    config = {
      pager = "less -R";
    };
    extraPackages = with pkgs.bat-extras; [
      batdiff
      batgrep
      prettybat
    ];
  };
}
