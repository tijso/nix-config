{ pkgs, ... }:
{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    kernelModules = [ "v4l2loopback" ];
    initrd.verbose = false;
    plymouth = {
      enable = true;
      theme = "optimus";
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
        extraConfig = "set theme=($drive2)${pkgs.breeze-grub}/grub/themes/breeze/theme.txt";
        splashImage = null;
        # catppuccin = {
        #   enable = true;
        #   flavor = "mocha";
        # };
      };
    };
  };
}

#   boot = {
#     supportedFilesystems = [ "ntfs" ];
#     loader.grub.enable = false;
#     loader.systemd-boot.enable = true;
#     loader.systemd-boot.memtest86.enable = true;
#     loader.efi.canTouchEfiVariables = true;
#
#     kernelPackages = pkgs.linuxPackages_latest;
#
#     consoleLogLevel = 0;
#     initrd.verbose = false;
#     plymouth.enable = false;
#     kernelParams = [
#       "quiet"
#       "splash"
#       "loglevel=3"
#       "rd.systemd.show_status=false"
#       "rd.udev.log_level=3"
#       "udev.log_priority=3"
#     ];
#   };
# }
