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
            lightTheme = false;
            activeBorderColor = [
              "#${config.colorScheme.palette.base0D}"
              "bold"
            ];
            inactiveBorderColor = [ "#${config.colorScheme.palette.base03}" ];
            optionsTextColor = [ "#${config.colorScheme.palette.base0C}" ];
            selectedLineBgColor = [ "#${config.colorScheme.palette.base02}" ];
            selectedRangeBgColor = [ "#${config.colorScheme.palette.base02}" ];
            cherryPickedCommitBgColor = [ "#${config.colorScheme.palette.base0A}" ];
            cherryPickedCommitFgColor = [ "#${config.colorScheme.palette.base00}" ];
            unstagedChangesColor = [ "#${config.colorScheme.palette.base08}" ];
            defaultFgColor = [ "#${config.colorScheme.palette.base05}" ];
            searchingActiveBorderColor = [ "#${config.colorScheme.palette.base09}" ];
          };

          # Window dimensions
          windowSize = "normal";
          scrollHeight = 2;
          scrollPastBottom = true;
          sidePanelWidth = 0.3333;
          expandFocusedSidePanel = false;
          mainPanelSplitMode = "flexible";
          enlargedSideViewLocation = "left";

          # Display settings
          showIcons = true;
          showRandomTip = true;
          showCommandLog = true;
          showBottomLine = true;
          showPanelJumps = true;
          showBranchCommitHash = false;
          showListFooter = true;
          showFileTree = true;
          showCommandLogOnStartup = false;

          # Borders
          border = "single"; # single, double, rounded, hidden
          animateExplosion = true;
          portraitMode = "auto";
          filterMode = "substring";
        };
      };
    };
  };
}
