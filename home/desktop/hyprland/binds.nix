{pkgs, ...}: let
  mainMod = "SUPER";
in {
  wayland.windowManager.hyprland = {
    settings = {
      bind = let
        # credit: hyprdots
        screenshot = pkgs.writeShellScriptBin "screenshot" ''
          if [ -z "$XDG_PICTURES_DIR" ] ; then
              XDG_PICTURES_DIR="$HOME/Pictures"
          fi

          swpy_dir="$HOME/.config/swappy"
          save_dir="''${2:-$XDG_PICTURES_DIR/Screenshots}"
          save_file=$(date +'%y%m%d_%Hh%Mm%Ss_screenshot.png')
          temp_screenshot="/tmp/screenshot.png"

          mkdir -p $save_dir
          mkdir -p $swpy_dir
          echo -e "[Default]\nsave_dir=$save_dir\nsave_filename_format=$save_file" > $swpy_dir/config

          case $1 in
          p)
              ${pkgs.grimblast}/bin/grimblast copysave screen $temp_screenshot ; ${pkgs.swappy}/bin/swappy -f $temp_screenshot ;;
          s)
              ${pkgs.grimblast}/bin/grimblast --freeze copysave area $temp_screenshot ; ${pkgs.swappy}/bin/swappy -f $temp_screenshot ;;
          m)
              ${pkgs.grimblast}/bin/grimblast copysave output $temp_screenshot ; ${pkgs.swappy}/bin/swappy -f $temp_screenshot ;;
          *)
              exit ;;
          esac

          rm "$temp_screenshot"

          if [ -f "$save_dir/$save_file" ] ; then
              notify-send "Smile! You're On Camera! 📸" "Screenshot saved in $save_dir" -i $save_dir/$save_file
          fi
        '';

        workspace = num: "${mainMod}, ${num}, workspace, ${num}";
        moveToWorkspace = num: "${mainMod} SHIFT, ${num}, movetoworkspace, ${num}";
        moveToWorkspaceSilent = num: "${mainMod} ALT, ${num}, movetoworkspacesilent, ${num}";

        workspaceArr = [1 2 3 4 5 6 7];
      in [
        # Windows
        "${mainMod} SHIFT, C, exit"
        "${mainMod}, Q, killactive"
        "${mainMod}, S, togglefloating"
        "${mainMod}, G, togglegroup"
        "${mainMod}, F, fullscreen"

        # Apps
        "${mainMod}, Return, exec, wezterm"
        "${mainMod}  SHIFT, W, exec, brave"
        "${mainMod}  SHIFT, RETURN, exec, wofi -f --show=drun"
        # "${mainMod} SHIFT, RETURN, exec, wofi -f --show=drun --lines=5 --prompt=\"\""

        # Screenshot
        "${mainMod} SHIFT, S, exec, ${screenshot}/bin/screenshot s"
        "${mainMod} ALT, S, exec, ${screenshot}/bin/screenshot m"
        ",print, exec, ${screenshot}/bin/screenshot p"

        # Focus
        "${mainMod}, h, movefocus, l"
        "${mainMod}, l, movefocus, r"
        "${mainMod}, k, movefocus, u"
        "${mainMod}, j, movefocus, d"
        "ALT, Tab, movefocus, d"

        # Switch workspaces relative
        "${mainMod} CTRL, l, workspace, r+1"
        "${mainMod} CTRL, h, workspace, r-1"

        # Move window around
        "${mainMod} SHIFT, h, movewindow, l"
        "${mainMod} SHIFT, l, movewindow, r"
        "${mainMod} SHIFT, k, movewindow, u"
        "${mainMod} SHIFT, j, movewindow, d"

        # Special workspaces
        "${mainMod}, E, movetoworkspacesilent, special"
        "${mainMod}, U, togglespecialworkspace"

        # Toggle Layout
        "${mainMod}, Y, togglesplit, # dwindle"
        "${mainMod}, P, pseudo"
      ];

      bindm = [
        "${mainMod}, mouse:272, movewindow"
        "${mainMod}, mouse:273, resizewindow"
      ];

      binde = [
        "${mainMod} ALT, l, resizeactive, 30 0"
        "${mainMod} ALT, h, resizeactive, -30 0"
        "${mainMod} ALT, k, resizeactive, 0 -30"
        "${mainMod} ALT, j, resizeactive, 0 30"
      ];

      bindl = [
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioStop, exec, ${pkgs.playerctl}/bin/playerctl stop"
        ",XF86AudioPrev, exec, ${pkgs.playerctl}/bin/playerctl previous"
        ",XF86AudioPlay, exec, ${pkgs.playerctl}/bin/playerctl play-pause"
        ",XF86AudioNext, exec, ${pkgs.playerctl}/bin/playerctl next"
      ];

      bindel = [
        ",XF86AudioRaiseVolume,   exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume,   exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86MonBrightnessUp,    exec, ${pkgs.brightnessctl}/bin/brightnessctl set +5%"
        ",XF86MonBrightnessDown,  exec, ${pkgs.brightnessctl}/bin/brightnessctl set 5%-"
      ];
    };
  };
}
