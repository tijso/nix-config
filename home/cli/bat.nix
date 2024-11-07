{
  pkgs,
  config,
  nur,
  ...
}: {
  home-manager.users.programs.bat = {
    enable = true;
    config = {
      theme = "catppuccin-mocha";
      pager = "less -R";
    };
    themes = {
      catpuccin-mocha = {
        src = pkgs.nur.repos.ryan4yin.catppuccin-bat;
        file = "Catpuccin-mocha.tmTheme";
      };
    };
    extraPackages = with pkgs.bat-extras; [
      batdiff
      batgrep
      prettybat
    ];
  };
}
