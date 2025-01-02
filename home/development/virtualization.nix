{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.modules.development.virtualization;
in
{
  options.modules.development.virtualization.enable = mkEnableOption "Enable Virtualization";
  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      qemu
      quickemu
    ];

    virtualization.libvirtd.enable = true;
    programs.virt-manager.enable = true;
  };
}
