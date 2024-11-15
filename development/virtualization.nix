{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
{
  options.virt.enable = mkEnableOption "virtualization configuration";

  config = mkIf config.virt.enable {
    home.packages = with pkgs; [
      qemu
      qemu-utils
      libvirt
      virt-manager
      virt-viewer
      quickemu
    ];

    virtualisation.libvirtd.enable = true;
    programs.virt-manager.enable = true;
    users.groups = [
      "libvirtd"
      "kvm"
      "qemu"
    ];
  };
}
