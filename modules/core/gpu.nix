{
  pkgs,
  config,
  lib,
  ...
}:
with lib; {
  options.myModules.core.gpu.enable = mkEnableOption "Enable Gpu";

  config = mkIf config.myModules.core.gpu.enable {
    hardware.graphics = {
      enable = true;
      extraPackages = with pkgs; [
        vulkan-loader
        vulkan-validation-layers
        vulkan-extension-layer
        # rocmPackages.clr.icd
        # amdvlk
      ];
    };
    hardware.opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };

    services.xserver.videoDrivers = ["amdgpu"];
    boot.initrd.kernelModules = ["amdgpu"];
  };
}
