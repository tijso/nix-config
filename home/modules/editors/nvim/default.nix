{
  config,
  lib,
  ...
}:
with lib;
{
  options.myHome.editors.nvim.enable = mkEnableOption "Enable Neovim";
  config = mkIf config.myHome.editors.nvim.enable {
    programs.neovim = {
      enable = true;
      package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
    };
  };
}
