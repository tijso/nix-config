{
  inputs,
  pkgs,
  ...
}: {
  programs.fish.enable = true;
  users.users.tijso = {
    # defaultUserShell = pkgs.fish;
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
      "video"
      "libvirtd"
    ];
    packages = with pkgs; [];
  };

  time.timeZone = "America/Chicago";
  time.hardwareClockInLocalTime = true;

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  environment.systemPackages = with pkgs; [
    # brave
    firefox
    bibata-cursors
    catppuccin-cursors
    imv
    killall
    kitty
    kitty-img
    kitty-themes
    networkmanagerapplet
    openrgb-with-all-plugins
    pkg-config
    amdgpu_top
    _1password-gui
  ];
}
