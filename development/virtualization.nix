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

    # Environment variables
    home.sessionVariables = {
      LIBVIRT_DEFAULT_URI = "qemu:///system";
      VAGRANT_DEFAULT_PROVIDER = "libvirt";
    };

    # Configuration files
    home.file = {
      # QEMU config
      ".config/qemu/qemu.conf".text = ''
        # Enable shared memory
        memory_backing_dir = "/dev/shm"

        # Security settings
        security_driver = "none"
        remember_owner = false

        # Network settings
        vnc_listen = "0.0.0.0"
        spice_listen = "0.0.0.0"
      '';

      # Default storage pool
      ".config/libvirt/storage/default.xml".text = ''
        <pool type="dir">
          <name>default</name>
          <target>
            <path>${config.home.homeDirectory}/VirtualMachines</path>
          </target>
        </pool>
      '';

      # Network configuration
      ".config/libvirt/qemu/networks/default.xml".text = ''
        <network>
          <name>default</name>
          <bridge name="virbr0"/>
          <forward mode="nat"/>
          <ip address="192.168.122.1" netmask="255.255.255.0">
            <dhcp>
              <range start="192.168.122.2" end="192.168.122.254"/>
            </dhcp>
          </ip>
        </network>
      '';
    };
  };
}
