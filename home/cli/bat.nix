{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.modules.cli.bat;
in
{
  options.modules.cli.bat.enable = mkEnableOption "Enable Bat";
  config = mkIf cfg.enable {
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
            rev = "f247ee700b569ed43f39320413a13ba9b0aef0db"; # Replace with latest commit
            sha256 = "";
          };
          file = "extras/sublime/tokyonight_storm.tmTheme";
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
