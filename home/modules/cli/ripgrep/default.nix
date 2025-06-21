{
  lib,
  config,
  ...
}:
with lib;

{
  options.myHome.cli.ripgrep.enable = mkEnableOption "Enable Bat";
  config = mkIf config.myHome.cli.ripgrep.enable {
    programs.ripgrep = {
      enable = true;
      arguments = [
        "--smart-case"
        "--hidden"
        "--glob=!.git/*"
      ];
    };
  };
}
