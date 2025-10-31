{
  pkgs,
  config,
  lib,
  ...
}:
with lib; {
  options.myModules.core.fonts.enable = mkEnableOption "Enable Fonts To Install";
  config = mkIf config.myModules.core.fonts.enable {
    fonts = {
      fontconfig = {
        enable = true;
        antialias = true;
        hinting = {
          enable = true;
          style = "full";
        };
        subpixel = {
          rgba = "rgb";
        };
      };

      fontDir.enable = true;
      enableDefaultPackages = true;

      packages = with pkgs; [
        jetbrains-mono
        noto-fonts
        noto-fonts-color-emoji
        maple-mono.NF
        monaspace
        fira-code
        iosevka
        material-icons
        cascadia-code
        nerd-fonts.jetbrains-mono
        nerd-fonts.hack
        nerd-fonts.symbols-only
      ];
    };
  };
}
