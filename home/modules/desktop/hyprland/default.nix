{
  pkgs,
  config,
  lib,
  ...
}:
with lib; {
  imports = [
    ./animations.nix
    ./autostart.nix
    ./decoration.nix
    ./env.nix
    ./keybindings.nix
    ./rules.nix
  ];

  options.myHome.desktop.hyprland.enable = mkEnableOption "Enable Hyprland";
  config = mkIf config.myHome.desktop.hyprland.enable {
    home.packages = with pkgs; [
      grim
      slurp
      swappy
      swww
      wl-clipboard
      wl-color-picker
      wlr-randr
      wayland-utils
      wayland-protocols
      ydotool
      hyprpicker
    ];
    wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;
      systemd.enable = true;
      settings = {
        monitor = [
          "DP-1,3840x2160,2560x0, 1"
          "DP-2,2560x1440, 0x0, 1"
        ];

        input = {
          kb_layout = "us";
          follow_mouse = true;
          numlock_by_default = true;

          touchpad = {
            natural_scroll = true;
            disable_while_typing = true;
            middle_button_emulation = true;
            tap-and-drag = true;
          };
        };

        debug.disable_logs = false;

        xwayland.force_zero_scaling = true;

        misc = {
          disable_hyprland_logo = true;
          disable_splash_rendering = true;

          enable_swallow = true;
          swallow_regex = "^(ghostty)$";
          vfr = false;
        };

        dwindle = {
          pseudotile = true;
          preserve_split = true;
          no_gaps_when_only = 0;
          force_split = 2;
        };

        gestures = {
          workspace_swipe = false;
        };
      };
    };
  };
}
