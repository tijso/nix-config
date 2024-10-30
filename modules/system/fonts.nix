{ pkgs, lib, inputs, ...}:

{
  fonts = {
    fontconfig.enable = true;
    fontDir.enable = true;
    packages = with pkgs; [
        cascadia-code
        iosevka
        fira-code
        font-awesome
        jetbrains-mono
        material-icons
        monaspace
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-emoji
        roboto
        roboto-mono
        ubuntu_font_family
        (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" "Hack" ]; })
    ];
  };

}
