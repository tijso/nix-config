{
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.modules.editors.nvim;
in
{
  options.modules.editors.nvim.enable = mkEnableOption "Enable Neovim";
  config = mkIf cfg.enable {
    programs.neovim = {
      enable = true;
      package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
    };
  };
}
