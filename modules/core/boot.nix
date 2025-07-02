{
  pkgs,
  config,
  lib,
  ...
}:
with lib; {
  options.myModules.core.boot = {
    enable = mkEnableOption "Enable boot configuration";
    plymouth = {
      enable = mkEnableOption "Enable Plymouth boot splash";
    };
  };

  config = mkIf config.myModules.core.boot.enable {
    boot = {
      kernelPackages = pkgs.linuxPackagesFor (pkgs.linux_6_14.override {
        argsOverride = rec {
          src = pkgs.fetchurl {
            url = "mirror://kernel/linux/kernel/v6.x/linux-${version}.tar.xz";
            sha256 = "sha256-IYF/GZjiIw+B9+T2Bfpv3LBA4U+ifZnCfdsWznSXl6k=";
          };
          version = "6.14.6";
          modDirVersion = "6.14.6";
        };
      });
      # kernelPackages = pkgs.linuxPackages_latest;
      kernelModules = ["v4l2loopback"];
      kernelParams = [
        "quiet"
        "splash"
        "plymouth.enable=1"
      ];
      consoleLogLevel = 0;
      kernel.sysctl = {
        "vm.max_map_count" = 2147483642;
      };
      initrd = {
        verbose = false;
        systemd.enable = true;
      };
      # extraModulePackages = [
      #   (config.boot.kernelPackages.v4l2loopback.overrideAttrs (old: {
      #     version = "0.15.0";
      #     src = pkgs.fetchFromGitHub {
      #       owner = "umlaeute";
      #       repo = "v4l2loopback";
      #       rev = "v0.15.0";
      #       sha256 = "sha256-fa3f8GDoQTkPppAysrkA7kHuU5z2P2pqI8dKhuKYh04=";
      #     };
      #   }))
      # ];
      plymouth.enable = mkIf config.myModules.core.boot.plymouth.enable true;
      loader = {
        efi = {
          canTouchEfiVariables = true;
          efiSysMountPoint = "/boot";
        };
        grub = {
          enable = true;
          devices = ["nodev"];
          efiSupport = true;
          useOSProber = true;
          configurationLimit = 10;
        };
      };
    };
  };
}
