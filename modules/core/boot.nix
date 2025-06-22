{
  pkgs,
  config,
  lib,
  ...
}:
with lib;
{
  options.myModules.core.boot = {
    enable = mkEnableOption "Enable boot configuration";
    plymouth = {
      enable = mkEnableOption "Enable Plymouth boot splash";
      theme = mkOption {
        type = types.str;
        default = "rings";
        description = "Plymouth theme to use";
      };
    };
    grubTheme = {
      enable = mkEnableOption "Enable GRUB theme";
      resolution = mkOption {
        type = types.str;
        default = "1920x1080";
        description = "GRUB theme resolution";
      };
    };
  };

  config = mkIf config.myModules.core.boot.enable {
    boot = {
      # Kernel configuration
      kernelPackages = pkgs.linuxPackages_6_6;
      # kernelPackages = pkgs.linuxPackages_latest;
      kernelModules = [ "v4l2loopback" ];
      kernelParams = [
        "quiet"
        "splash"
        "plymouth.enable=1"
      ];
      consoleLogLevel = 0;

      # System control parameters
      kernel.sysctl = {
        "vm.max_map_count" = 2147483642;
      };

      # Initial ramdisk configuration
      initrd = {
        verbose = false;
        systemd.enable = true;
      };

      # V4L2 loopback module
      extraModulePackages = [
        (config.boot.kernelPackages.v4l2loopback.overrideAttrs (old: {
          version = "0.15.0";
          src = pkgs.fetchFromGitHub {
            owner = "umlaeute";
            repo = "v4l2loopback";
            rev = "v0.15.0";
            sha256 = "sha256-fa3f8GDoQTkPppAysrkA7kHuU5z2P2pqI8dKhuKYh04=";
          };
        }))
      ];

      # Plymouth boot splash
      plymouth = mkIf config.myModules.core.boot.plymouth.enable {
        enable = true;
        # theme = config.myModules.core.boot.plymouth.theme;
        # themePackages = with pkgs; [
        #   (adi1090x-plymouth-themes.override {
        #     selected_themes = [
        #       "rings"
        #       "optimus"
        #       "cybernetic"
        #       "lone"
        #     ];
        #   })
        # ];
      };

      # Boot loader configuration
      loader = {
        efi = {
          canTouchEfiVariables = true;
          efiSysMountPoint = "/boot";
        };

        grub = {
          enable = true;
          devices = [ "nodev" ];
          efiSupport = true;
          useOSProber = true;
          configurationLimit = 10;
        };

        # grub2-theme = mkIf config.myModules.core.boot.grubTheme.enable {
        #   theme = "whitesur";
        #   footer = true;
        #   customResolution = config.myModules.core.boot.grubTheme.resolution;
        # };
      };
    };
  };
}
