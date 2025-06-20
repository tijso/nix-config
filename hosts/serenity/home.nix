{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.nix-colors.homeManagerModule
    ../../home
  ];

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

  home.shellAliases = {
    config = "cd ~/nix-config";
    rebuild = "sudo nixos-rebuild switch --flake ~/nix-config#serenity";
    rebuild-home = "home-manager switch --flake ~/nix-config#tijso@serenity";
    update = "cd ~/nix-config && nix flake update";
    clean = "sudo nix-collect-garbage -d && nix store optimise";
    search = "nix search nixpkgs";

    ls = "eza -l";
    la = "eza -a";
    ll = "eza -la";
    # la = "eza --icons -la";
    lt = "eza --tree";

    vi = "nvim";
    vim = "nvim";

    personal = "cd ~/projects/personal";
    github = "cd ~/projects/personal/github";
    gitlab = "cd ~/projects/personal/gitlab";
    mkdir = "mkdir -p";
    cat = "bat --paging=never";
    man = "tldr";
    grep = "rg";
    find = "fd";
    lg = "lazygit";
    img = "wezterm imgcat";
    ".." = "cd ..";
    "..." = "cd ../..";
  };

  home.packages = with pkgs; [
    inputs.nixvim.packages.x86_64-linux.default
    inputs.ghostty.packages.${pkgs.system}.default
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

  myHome = {
    mpv.enable = false;
    # rofi.enable = false;
    tmux.enable = true;
    fuzzel.enable = true;
    mako.enable = false;
    waybar.enable = false;

    cli = {
      bat.enable = true;
      eza.enable = true;
      fastfetch.enable = true;
      fish.enable = true;
      lazygit.enable = true;
      starship.enable = true;
      zsh.enable = true;
    };

    desktop = {
      gnome.enable = true;
      hyprland.enable = false;
      niri.enable = false;
    };

    development = {
      git.enable = true;
      go.enable = true;
      nixdev.enable = true;
      direnv.enable = true;
    };

    editors = {
      helix.enable = true;
      nvim.enable = false;
    };

    terminals = {
      ghostty.enable = true;
      kitty.enable = false;
      wezterm.enable = true;
    };

    theming = {
      gtk.enable = true;
    };

  };

  # colorScheme = inputs.nix-colors.colorSchemes.tokyo-night-storm;
  colorScheme = {
    slug = "rose-pine";
    name = "Rosé Pine";
    author = "Emilia Dunfelt <edun@dunfelt.se>";
    variant = "dark";
    palette = {
      base00 = "#191724";
      base01 = "#1f1d2e";
      base02 = "#26233a";
      base03 = "#6e6a86";
      base04 = "#908caa";
      base05 = "#e0def4";
      base06 = "#e0def4";
      base07 = "#524f67";
      base08 = "#eb6f92";
      base09 = "#f6c177";
      base0A = "#ebbcba";
      base0B = "#31748f";
      base0C = "#9ccfd8";
      base0D = "#c4a7e7";
      base0E = "#f6c177";
      base0F = "#524f67";
    };
  };

  programs.nix-index = {
    enable = true;
    enableFishIntegration = true;
  };

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
