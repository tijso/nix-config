{ pkgs, lib, ...}:

{
  environment.systemPackages = with pkgs; [
    qemu
    quickemu
  ];

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
}
