{
  pkgs,
  lib,
  config,
  ...
}:
{
  imports = [
    ./bat.nix
    ./eza.nix
    ./fastfetch
    # ./fish.nix
    ./git.nix
    ./starship.nix
    ./zsh.nix
  ];

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    defaultCommand = "fd --type f --max-depth 10";
    changeDirWidgetCommand = "fd --type d --max-depth 10";
    fileWidgetCommand = "fd --type f --max-depth 10";
    defaultOptions = [
      "--height 40%"
      "--layout=reverse"
      "--info=inline"
      "--preview-window=:hidden"
      "--prompt='~ ' --pointer='▶' --marker='✓'"
      "--bind '?:toggle-preview'"
      "--bind 'ctrl-a:select-all'"
      "--bind 'ctrl-y:execute-silent(echo {+} | wl-copy)'"
      "--bind 'ctrl-e:execute(echo {+} | xargs -o nvim)'"
    ];
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    options = [
      "--cmd cd"
    ];
  };

  home.packages = with pkgs; [
    btop
    fd
    ripgrep
    duf
    tldr
    tree
    qbittorrent
  ];
}
