{ pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
      catppuccin-plymouth
    ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    kernelModules = [ "v4l2loopback" ];
    initrd.verbose = false;
    plymouth = {
      enable = true;
      theme = "catppuccin";
      themePackages = with pkgs; [
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "catppuccin"];
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
    };
  };
}
