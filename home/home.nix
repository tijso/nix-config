{
  pkgs,
  inputs,
  nix-colors,
  ...
}:
{
  imports = [
    nix-colors.homeManagerModules.default
    # ./editors
    ./environments/gtk.nix
    ./environments/gnome.nix
    # ./environments/hyprland
    ./development
    ./mpv
    ./utils
    ./terminals
    ./shells
    # ./tmux
  ];

  nixdev.enable = true;
  thunar.enable = true;
  go.enable = true;
  bat.enable = true;
  fzf.enable = true;
  eza.enable = true;
  virt.enable = true;

  home.packages = with pkgs; [
    inputs.nixvim.packages.x86_64-linux.default
    tree
    btop
    inkscape
    ookla-speedtest
    gnome-disk-utility
    cava
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

  colorScheme = nix-colors.colorSchemes.catppuccin-mocha;

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
  home.sessionVariables = {
    # Use fd instead of find
    FZF_CTRL_T_COMMAND = "fd --type file --hidden --follow --exclude .git";
    FZF_ALT_C_COMMAND = "fd --type directory --hidden --follow --exclude .git";

    # Preview window settings for different commands
    FZF_CTRL_T_OPTS = "--preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (eza --tree {} | less)) || echo {} 2> /dev/null | head -200'";
    FZF_ALT_C_OPTS = "--preview 'eza --tree {} | head -200'";
    FZF_CTRL_R_OPTS = "--preview 'echo {}' --preview-window up:3:hidden:wrap --bind '?:toggle-preview'";

    # Use fd for completion
    _FZF_COMPLETION_OPTS = "--border --info=inline";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}
