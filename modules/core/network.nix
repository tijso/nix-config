{ config, lib, ... }:
with lib;
{
  options.myModules.core.network.enable = mkEnableOption "Enable Network";
  config = mkIf config.myModules.core.network.enable {
    networking = {
      hostName = "serenity";
      networkmanager.enable = true;
    };
  };
}
