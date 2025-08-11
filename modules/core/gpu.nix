{
  pkgs,
  config,
  lib,
  ...
}:
with lib; {
  options.myModules.core.gpu.enable = mkEnableOption "Enable Gpu";

  config = mkIf config.myModules.core.gpu.enable {
    hardware = {
      opengl.enable = true;
      graphics = {
        enable = true;
        extraPackages = with pkgs; [
          vulkan-loader
          vulkan-validation-layers
          vulkan-extension-layer
          # rocmPackages.clr.icd
          # amdvlk
        ];
      };
    };

    services.xserver.videoDrivers = ["amdgpu"];
    boot.initrd.kernelModules = ["amdgpu"];
  };
}
