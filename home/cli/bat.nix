{
  pkgs,
  config,
  ...
}: {
  programs.bat = {
    enable = true;
    catppuccin.enable = true;
    extraPackages = with pkgs.bat-extras; [
      # batdiff
      batgrep
      prettybat
    ];
  };
}
