{
  # pkgs,
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.modules.development.lazygit;
in
{
  options.modules.development.lazygit.enable = mkEnableOption "Enable Lazygit";
  config = mkIf cfg.enable {
    programs.lazygit = {
      enable = true;
      catppuccin.enable = true;
    };
  };
}
