{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
{
  options.eza.enable = mkEnableOption "eza configuration";

  config = mkIf config.eza.enable {
    home.packages = with pkgs; [
      eza
    ];
    programs.eza = {
      enable = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
      icons = "auto";
      git = true;
      extraOptions = [
        "--group-directories-first"
      ];
    };
  };
}
