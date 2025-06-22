{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:
with lib;
{

  imports = [
    inputs.niri.nixosModules.niri
  ];

  options.myModules.desktop.niri.enable = mkEnableOption "Enable Niri";
  config = mkIf config.myModules.desktop.niri.enable {
    programs.niri = {
      enable = true;
      package = pkgs.niri-unstable;
    };

    environment.systemPackages = with pkgs; [
      catppuccin-sddm
      sddm-sugar-dark
      libsForQt5.qt5.qtgraphicaleffects
      wayland
      wayland-protocols
      wayland-utils
      wlr-randr
    ];

    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --cmd ${pkgs.niri-unstable}/bin/niri-session";
          user = "greeter";
        };
      };
    };

    # Uncomment below for graphical greeter (gtkgreet - most stable GUI option)
    # services.greetd = {
    #   enable = true;
    #   settings = {
    #     default_session = {
    #       command = "${pkgs.greetd.gtkgreet}/bin/gtkgreet -l -s /etc/greetd/gtkgreet.css; swaymsg exit";
    #       user = "greeter";
    #     };
    #   };
    # };
    #
    # # GTK greeter styling
    # environment.etc."greetd/gtkgreet.css".text = ''
    #   window {
    #     background-image: url("file:///etc/nixos/stylix/Wallpapers/Tunnel.png");
    #     background-size: cover;
    #     background-position: center;
    #   }
    #
    #   box#body {
    #     background-color: rgba(50, 50, 50, 0.9);
    #     border-radius: 10px;
    #     padding: 50px;
    #   }
    #
    #   #clock, #date {
    #     color: white;
    #   }
    #
    #   #login_button, #restart_button, #shutdown_button {
    #     color: white;
    #     background-color: rgba(255, 255, 255, 0.1);
    #     border-radius: 5px;
    #     padding: 5px;
    #   }
    #
    #   #login_button:hover, #restart_button:hover, #shutdown_button:hover {
    #     background-color: rgba(255, 255, 255, 0.2);
    #   }
    # '';

    # Alternative: ReGreet (modern, but newer/less tested)
    # services.greetd = {
    #   enable = true;
    #   settings = {
    #     default_session = {
    #       command = "${pkgs.cage}/bin/cage -s -- ${pkgs.greetd.regreet}/bin/regreet";
    #       user = "greeter";
    #     };
    #   };
    # };
    #
    # programs.regreet = {
    #   enable = true;
    #   settings = {
    #     background = {
    #       path = "/etc/nixos/stylix/Wallpapers/Tunnel.png";
    #       fit = "Cover";
    #     };
    #     appearance = {
    #       greeting_msg = "Welcome back!";
    #     };
    #     GTK = {
    #       application_prefer_dark_theme = true;
    #       cursor_theme_name = "Adwaita";
    #       font_name = "Cantarell 16";
    #       icon_theme_name = "Adwaita";
    #       theme_name = "Adwaita-dark";
    #     };
    #   };
    # };

    # services.displayManager.sddm = {
    #   enable = true;
    #   wayland.enable = true;
    #   enableHidpi = true;
    #   autoNumlock = true;
    #   theme = "sugar-dark";
    #   settings = {
    #     Theme = {
    #       Current = "sugar-dark";
    #       Background = "../stylix/Wallpapers/Tunnel.png";
    #       # ScreenWidth = "1920";
    #       # ScreenHeight = "1080";
    #       # ScaleImageCropped = "true";
    #       # DimBackgroundImage = "0.0";
    #     };
    #   };
    # };

    services.displayManager.sessionPackages = [ pkgs.niri-unstable ];

    programs.ssh.startAgent = true;
    services.gnome.gnome-keyring.enable = lib.mkForce false;
    services.gnome.gcr-ssh-agent.enable = lib.mkForce false;

    security.polkit.enable = true;
    systemd.user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };

    environment.variables = {
      MOZ_ENABLE_WAYLAND = "1";
      NIXOS_OZONE_WL = "1";
      WAYLAND_DISPLAY = "wayland-0";
    };

    services.dbus.enable = true;
    services.udev.enable = true;

    xdg.portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-wlr
      ];

      config.common.default = "*";
    };
  };
}
