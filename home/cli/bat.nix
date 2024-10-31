{
  pkgs,
  config,
  ...
}: {
  programs.bat = {
    enable = true;
    catppuccin.flavor = "mocha";
    extraPackages = with pkgs.bat-extras; [
      batdiff
      batgrep
      prettybat
    ];
  };
}
