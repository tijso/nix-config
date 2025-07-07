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
      kernelPackages = pkgs.linuxPackages_6_12;
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
