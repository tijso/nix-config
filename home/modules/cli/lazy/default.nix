{
  # pkgs,
  lib,
  config,
  ...
}:
with lib;

{
  options.myHome.cli.lazygit.enable = mkEnableOption "Enable Lazygit";
  config = mkIf config.myHome.cli.lazygit.enable {
    programs.lazygit = {
      enable = true;
      settings = {
        gui = {
          theme = {
            lightTheme = false;
            activeBorderColor = [
              "#${config.lib.stylix.colors.base0D}"
              "bold"
            ];
            inactiveBorderColor = [ "#${config.lib.stylix.colors.base03}" ];
            optionsTextColor = [ "#${config.lib.stylix.colors.base0C}" ];
            selectedLineBgColor = [ "#${config.lib.stylix.colors.base02}" ];
            selectedRangeBgColor = [ "#${config.lib.stylix.colors.base02}" ];
            cherryPickedCommitBgColor = [ "#${config.lib.stylix.colors.base0A}" ];
            cherryPickedCommitFgColor = [ "#${config.lib.stylix.colors.base00}" ];
            unstagedChangesColor = [ "#${config.lib.stylix.colors.base08}" ];
            defaultFgColor = [ "#${config.lib.stylix.colors.base05}" ];
            searchingActiveBorderColor = [ "#${config.lib.stylix.colors.base09}" ];
          };

          # Window dimensions
          screenMode = "normal";
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
