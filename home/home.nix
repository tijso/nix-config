{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.nix-colors.homeManagerModule
    ./cli
    ./desktop
    ./development
    ./editors
    ./programs
    ./terminals
    ./theming
  ];

  modules = {
    cli = {
      bat.enable = true;
      eza.enable = true;
      fastfetch.enable = true;
      fish.enable = true;
      starship.enable = true;
      zsh.enable = false;
    };
    desktop = {
      gnome.enable = true;
      hyprland.enable = false;
    };
    development = {
      git.enable = true;
      go.enable = true;
      lazygit.enable = true;
      nixdev.enable = true;
    };
    editors = {
      helix.enable = false;
      nvim.enable = false;
    };
    programs = {
      mpv.enable = true;
      # rofi.enable = true;
      thunar.enable = true;
      tmux.enable = true;
    };
    terminals = {
      kitty.enable = false;
      wezterm.enable = true;
      ghostty.enable = true;
    };
    theming = {
      gtk.enable = true;
      # stylix.enable = false;
    };
  };

  home.packages = with pkgs; [
    inputs.nixvim.packages.x86_64-linux.default
    # inputs.ghostty.packages."${pkgs.system}".default
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

  # colorScheme = inputs.nix-colors.colorSchemes.tokyo-night-storm;
  colorScheme = {
    slug = "custom-dark";
    name = "Moonfly";
    author = "tijso";
    palette = {
      base00 = "080808"; # background
      base01 = "323437"; # color0 (darker background)
      base02 = "949494"; # color8 (selection background)
      base03 = "c6c6c6"; # color7 (comments)
      base04 = "bdbdbd"; # foreground (dark foreground)
      base05 = "bdbdbd"; # foreground (default foreground)
      base06 = "e4e4e4"; # color15 (light foreground)
      base07 = "e4e4e4"; # color15 (lightest foreground)
      base08 = "ff5d5d"; # color1 (red)
      base09 = "e3c78a"; # color3 (orange/yellow)
      base0A = "c6c684"; # color11 (yellow)
      base0B = "8cc85f"; # color2 (green)
      base0C = "79dac8"; # color6 (cyan)
      base0D = "80a0ff"; # color4 (blue)
      base0E = "cf87e8"; # color5 (magenta)
      base0F = "ff5189"; # color9 (bright red/pink)
    };
  };

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
