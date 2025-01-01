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
              "#7aa2f7"
              "bold"
            ]; # Light blue
            inactiveBorderColor = [ "#545c7e" ]; # Muted blue-gray
            optionsTextColor = [ "#7dcfff" ]; # Sky blue
            selectedLineBgColor = [ "#2f334d" ]; # Dark blue-gray
            selectedRangeBgColor = [ "#2f334d" ]; # Dark blue-gray
            cherryPickedCommitBgColor = [ "#3b4261" ]; # Darker blue-gray
            cherryPickedCommitFgColor = [ "#7aa2f7" ]; # Light blue
            unstagedChangesColor = [ "#f7768e" ]; # Pink/Red
            defaultFgColor = [ "#c0caf5" ]; # Light gray-blue
            searchingActiveBorderColor = [ "#bb9af7" ]; # Purple

            # Additional Tokyo Night specific colors
            statusBarBgColor = [ "#1f2335" ]; # Dark background
            commandBarBgColor = [ "#1f2335" ]; # Dark background
            menuBgColor = [ "#1f2335" ]; # Dark background
            menuFgColor = [ "#c0caf5" ]; # Light gray-blue
            commitLength = {
              show = true;
            };
          };
        };

      };
    };
  };
}
