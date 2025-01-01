{
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.modules.cli.eza;
in
{
  options.modules.cli.eza.enable = mkEnableOption "Enable Eza";
  config = mkIf cfg.enable {
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
