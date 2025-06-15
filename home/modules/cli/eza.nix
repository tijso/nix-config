{
  lib,
  config,
  ...
}:
with lib;

{
  options.myHome.cli.eza.enable = mkEnableOption "Enable Eza";
  config = mkIf config.myHome.cli.eza.enable {
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
