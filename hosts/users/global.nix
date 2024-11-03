{ pkgs, ... }: {
  imports = [];

  # program.fish.enable = true;
  users.users.tijso = {
    home = "/home/tijso";
    description = "tijso";
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "storage" "libvirtd" ];
    shell = pkgs.fish;
  };
}
