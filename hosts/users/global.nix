{ pkgs, lib, ... }:
{
  imports = [ ];
  time.timeZone = "America/Chicago";
  time.hardwareClockInLocalTime = true;

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = lib.mkForce "us";
    useXkbConfig = true;
  };

  programs.zsh.enable = true;
  users.users.tijso = {
    home = "/home/tijso";
    description = "tijso";
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "storage"
      "libvirtd"
    ];
    shell = pkgs.zsh;
  };
}
