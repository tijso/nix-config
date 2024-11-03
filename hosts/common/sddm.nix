{pkgs, ...}: {
  services.displayManager.sddm = {
    enable = true;
    enableHidpi = true;
    autoNumlock = true;
    wayland.enable = true;
    theme = "catppuccin";
  };

  environment.systemPackages = with pkgs; [
    sddm-chili-theme
    catppuccin-sddm
    sddm-sugar-dark
    libsForQt5.qt5.qtgraphicaleffects
  ];

  security.pam.services.sddm.enableGnomeKeyring = true;
}
