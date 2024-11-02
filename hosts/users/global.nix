{ pkgs, ... }: {
  imports = [
    ../../home/environments/hyprland/software/global.nix
    ../../home/software/global.nix
    ../../devices/printers/tsc-te244
    ../../devices/printers

    ../../common/audio
    ../../common/boot.nix
    ../../common/filesystem.nix
    ../../common/gdm.nix
    ../../common/general.nix
    ../../common/keyring.nix
    ../../common/network.nix
    ../../common/touchpad.nix
  ];

  # program.fish.enable = true;
  users.users.tijso = {
    home = "/home/tijso";
    description = "tijso";
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "storage" "libvirtd" ];
    shell = pkgs.fish;
  };
}
