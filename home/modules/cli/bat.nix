{
  pkgs,
  lib,
  config,
  ...
}:
with lib;

{
  options.myHome.cli.bat.enable = mkEnableOption "Enable Bat";
  config = mkIf config.myHome.cli.bat.enable {
    programs.bat = {
      enable = true;
      config = {
        theme = "tokyo-night";
      };
      themes = {
        tokyo-night = {
          src = pkgs.fetchFromGitHub {
            owner = "folke";
            repo = "tokyonight.nvim";
            rev = "45d22cf0e1b93476d3b6d362d720412b3d34465c"; # Replace with latest commit
            sha256 = "sha256-TJ/a6N6Cc1T0wdMxMopma1NtwL7rMYbZ6F0zFI1zaIA=";
          };
          file = "extras/sublime/tokyonight_night.tmTheme";
        };
      };
      extraPackages = with pkgs.bat-extras; [
        batdiff
        batgrep
        prettybat
      ];
    };
  };
}
