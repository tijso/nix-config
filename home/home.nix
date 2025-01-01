{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.nix-colors.homeManagerModule
    ./cli
    # ./cli/bat.nix
    # ./cli/eza.nix
    # ./editors
    ./environments/gtk.nix
    ./environments/gnome.nix
    # ./environments/hyprland
    ./mpv
    # ./software
    ./terminals
    ./development
    # ./tmux
  ];

  modules = {
    cli = {
      bat.enable = true;
      eza.enable = true;
    };
  };

  home.packages = with pkgs; [
    inputs.nixvim.packages.x86_64-linux.default
    inputs.ghostty.packages."${pkgs.system}".default
    tree
    btop
    inkscape
    ookla-speedtest
    gnome-disk-utility
    telegram-desktop
    gimp
    corefonts
    cachix
    qbittorrent
    ani-cli
    imagemagick
    sxiv
    optipng
    pamixer
  ];

  colorScheme = inputs.nix-colors.colorSchemes.tokyo-night-dark;

  home = {
    username = "tijso";
    homeDirectory = "/home/tijso";
    sessionPath = [ "$HOME/.local/bin" ];
    sessionVariables = {
      EDITOR = "nvim";
      PAGER = "bat";
      TERMINAL = "wezterm";
    };
  };

  programs.nix-index = {
    enable = true;
    enableFishIntegration = true;
  };

  # home.file.".config/ghostty/config" = {
  #   source = ../../config/ghostty/config;
  #   recursive = true;
  # };

  # programs.direnv = {
  #   enable = true;
  #   enableBashIntegration = true;
  #   enableFishIntegration = true;
  #   enableZshIntegration = true;
  #   enableNushellIntegration = true;
  #   nix-direnv.enable = true;
  # };

  # xdg = {
  #   enable = true;
  #   userDirs = {
  #     enable = true;
  #     createDirectories = true;
  #   };
  # };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}
