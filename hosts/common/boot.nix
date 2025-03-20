{ pkgs, config, ... }:
{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    kernelModules = [ "v4l2loopback" ];
    extraModulePackages = [ config.boot.kernelPackages.v4l2loopback ];
    kernel.sysctl = {
      "vm.max_map_count" = 2147483642;
    };
    plymouth = {
      enable = true;
      theme = "cybernetic";
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
      grub2-theme = {
        theme = "whitesur";
        footer = true;
        customResolution = "3840x2160";
      };
    };
  };
}
