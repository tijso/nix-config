{
  lib,
  config,
  ...
}:
with lib;
{
  options.myHome.development.direnv.enable = mkEnableOption "Enable direnv";
  config = mkIf config.myHome.development.direnv.enable {
    programs.direnv = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
      nix-direnv.enable = true;
    };
  };
}
