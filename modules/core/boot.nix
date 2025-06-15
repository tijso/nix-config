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
    };
    grubTheme = {
      enable = mkEnableOption "Enable GRUB theme";
    };
  };

  config = mkIf config.myModules.core.boot.enable {
    boot = {
      # Set the kernel to 6.6, as there is some bug with the latest kernel in NixOS.
      kernelPackages = pkgs.linuxPackages_6_6;
      # kernelPackages = pkgs.linuxPackages_latest;
      kernelModules = [ "v4l2loopback" ];
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
      kernel.sysctl = {
        "vm.max_map_count" = 2147483642;
      };

      plymouth = mkIf config.myModules.core.boot.plymouth.enable {
        enable = true;
        theme = "rings";
        themePackages = with pkgs; [
          (adi1090x-plymouth-themes.override {
            selected_themes = [
              "rings"
              "optimus"
              "cybernetic"
              "lone"
            ];
          })
        ];
      };

      loader = {
        efi.canTouchEfiVariables = true;
        efi.efiSysMountPoint = "/boot";
        grub = {
          enable = true;
          devices = [ "nodev" ];
          efiSupport = true;
          useOSProber = true;
          configurationLimit = 10;
        };
        grub2-theme = mkIf config.myModules.core.boot.grubTheme.enable {
          theme = "whitesur";
          footer = true;
          customResolution = "3840x2160";
        };
      };
    };
  };
}
