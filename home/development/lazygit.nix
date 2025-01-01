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
      settings = {
        gui = {
          theme = {
            activeBorderColor = [
              "#24EAF7"
              "bold"
            ]; # Cyan
            inactiveBorderColor = [ "#214969" ]; # Dark blue
            optionsTextColor = [ "#44FFB1" ]; # Green
            selectedLineBgColor = [ "#033259" ]; # Selection background
            selectedRangeBgColor = [ "#033259" ]; # Selection background
            cherryPickedCommitBgColor = [ "#214969" ]; # Dark blue
            cherryPickedCommitFgColor = [ "#A277FF" ]; # Purple
            unstagedChangesColor = [ "#E52E2E" ]; # Red
            defaultFgColor = [ "#CBE0F0" ]; # Foreground
            searchingActiveBorderColor = [ "#FFE073" ]; # Yellow

            # Additional theme settings using your colors
            statusBarBgColor = [ "#011423" ]; # Background
            commandBarBgColor = [ "#011423" ]; # Background
            menuBgColor = [ "#011423" ]; # Background
            menuFgColor = [ "#CBE0F0" ]; # Foreground
          };
        };
      };
    };
  };
}
