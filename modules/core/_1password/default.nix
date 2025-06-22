{
  pkgs,
  config,
  lib,
  ...
}:
with lib;
{
  options.myModules.core._1password.pkgs.enable = mkEnableOption " Enable _1password";
  config = mkIf config.myModules.core._1password.enable {
    environment.systemPackages = with pkgs; [
      _1password-gui
    ];

    programs._1password.enable = true;
    programs._1password-gui = {
      enable = true;
      polkitPolicyOwners = [ "tijso" ];
    };

    security.polkit.enable = true;
  };
}
