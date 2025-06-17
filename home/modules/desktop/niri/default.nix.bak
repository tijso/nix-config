{
  inputs,
  pkgs,
  config,
  lib,
  ...
}:
with lib;
{
  imports = [ ];

  options.myHome.desktop.niri.enable = mkEnableOption "Enable Niri";
  config = mkIf config.myHome.desktop.niri.enable {
    home.packages = with pkgs; [
      # niri
      waybar
      fuzzel
    ];

    programs.niri = {
      enable = true;
      settings = {
        input = {
          keyboard.xkb.layout = "us";
        };

        layout = {
          gaps = 16;
          center-focused-column = "never";
        };

        spawn-at-startup = [
          { command = [ "${pkgs.waybar}/bin/waybar" ]; }
        ];

        binds = with inputs.niri.lib.niri.actions; {
          "Mod+Return".action = spawn "ghostty";
          "Mod+D".action = spawn "${pkgs.fuzzel}/bin/fuzzel";
          "Mod+Q".action = close-window;
        };
      };
    };
  };
}
