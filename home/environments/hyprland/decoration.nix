{
  pkgs,
  config,
  inputs,
  ...
}: {
  wayland.windowManager.hyprland = {
    settings = {
      general = {
        gaps_in = "8";
        gaps_out = "12";
        border_size = "3";
        layout = "dwindle";
        # "col.active_border" = "$color8";
        # "col.inactive_border" = "$color8";
      };

      cursor = {
        inactive_timeout = 2;
        no_warps = true;
      };

      decoration = {
        rounding = "4";
        drop_shadow = "true";
        shadow_range = "18";
        shadow_render_power = "3";
        "col.shadow" = "rgba(00000066)";

        active_opacity = "1";
        inactive_opacity = "0.94";

        blur = {
          enabled = "true";
          size = "3";
          passes = "4";
          new_optimizations = "true";
          ignore_opacity = "true";
          noise = 0.1;
          popups = true;
        };

        blurls = [
          "waybar"
          "rofi"
          "notifications"
        ];
      };
    };
  };
}
