{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ../../home
  ];

  home = {
    username = "tijso";
    homeDirectory = "/home/tijso";
    sessionPath = [ "$HOME/.local/bin" ];
    sessionVariables = {
      BROWSER = "brave";
      EDITOR = "nvim";
      PAGER = "bat";
      TERMINAL = "ghostty";
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
    lt = "eza --tree";

    vi = "nvim";
    vim = "nvim";

    personal = "cd ~/projects/personal";
    github = "cd ~/projects/personal/github";
    gitlab = "cd ~/projects/personal/gitlab";

    mkdir = "mkdir -p";
    cat = "bat";
    man = "tldr";
    grep = "rg";
    find = "fd";

    ".." = "cd ..";
    "..." = "cd ../..";

    lg = "lazygit";
    img = "wezterm imgcat";

    # # Cli Trash Commands
    # tl = "trash-list";
    # te = "trash-empty";
    # tr = "trash-restore";
    # tm = "trash-rm";
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
    apps = {
      fuzzel.enable = true;
      mako.enable = true;
      mpv.enable = false;
      tmux.enable = true;
    };

    cli = {
      bat.enable = true;
      eza.enable = true;
      fastfetch.enable = true;
      fish.enable = true;
      lazygit.enable = true;
      ssh.enable = true;
      starship.enable = true;
      zsh.enable = true;
      ripgrep.enable = true;
    };

    desktop = {
      gnome.enable = false;
      hyprland.enable = false;
      niri.enable = true;
      waybar.enable = true;
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
      wezterm.enable = true;
    };

    theming = {
      gtk.enable = true;
      stylix.enable = true;
    };

  };

  programs.nix-index = {
    enable = true;
    enableFishIntegration = true;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}
