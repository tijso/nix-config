{
  pkgs,
  lib,
  ...
}: {
  time.timeZone = "America/Chicago";
  time.hardwareClockInLocalTime = true;

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = lib.mkForce "us";
    useXkbConfig = true;
    packages = with pkgs; [terminus_font];
  };

  programs.fish.enable = true;
  users.users.tijso = {
    home = "/home/tijso";
    description = "tijso";
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "storage"
      "libvirtd"
      "ssh-agent"
    ];
    shell = pkgs.fish;
  };
}
