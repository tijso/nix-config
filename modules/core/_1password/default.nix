{
  pkgs,
  config,
  lib,
  ...
}:
with lib; {
  options.myModules.core._1password.enable = mkEnableOption " Enable _1password";
  config = mkIf config.myModules.core._1password.enable {
    programs._1password.enable = true;
    programs._1password-gui = {
      enable = true;
      polkitPolicyOwners = ["tijso"];
      package = pkgs._1password-gui.overrideAttrs (_: {
        postFixup = ''
          makeWrapper $out/bin/1password $out/bin/1password \
            --add-flags "--enable-features=UseOzonePlatform" \
            --add-flags "--ozone-platform=wayland"
        '';
      });
    };
  };
}
