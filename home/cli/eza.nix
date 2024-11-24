{
  lib,
  config,
  ...
}:
with lib;
{
  options.eza.enable = mkEnableOption "eza settings";
  config = mkIf config.eza.enable {
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
