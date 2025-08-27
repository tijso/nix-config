{
  pkgs,
  # inputs,
  ...
}: {
  imports = [
    ../../home
  ];

  home = {
    username = "tijso";
    homeDirectory = "/home/tijso";
    sessionPath = ["$HOME/.local/bin"];
    sessionVariables = {
      BROWSER = "brave";
      EDITOR = "nvim";
      PAGER = "bat";
      TERMINAL = "ghostty";
    };
  };

  home.packages = with pkgs; [
    # inputs.ghostty.packages.${pkgs.system}.default
    btop
    cliphist
    fd
    # gimp
    imagemagick
    inkscape
    qbittorrent
    tree
  ];

  myHome = {
    apps = {
      fuzzel.enable = true;
      mpv.enable = false;
      tmux.enable = true;
    };

    cli = {
      bat.enable = true;
      eza.enable = true;
      fastfetch.enable = true;
      fish.enable = true;
      lazygit.enable = true;
      nushell.enable = true;
      ripgrep.enable = true;
      ssh.enable = true;
      starship.enable = true;
      zsh.enable = true;
    };

    desktop = {
      gnome.enable = false;
      hyprland.enable = false;
      niri.enable = true;
      swaync.enable = true;
      waybar.enable = true;
      wlogout.enable = true;
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
      nvf.enable = true;
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
