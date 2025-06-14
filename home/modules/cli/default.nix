{
  pkgs,
  ...
}:
{
  imports = [
    # ./bat.nix
    # ./eza.nix
    # ./fastfetch
    # ./fish.nix
    # ./starship.nix
    ./zsh.nix
    # ./lazygit.nix
  ];

  # programs.fzf = {
  #   enable = true;
  #   enableZshIntegration = true;
  #   enableFishIntegration = true;
  #   defaultCommand = "fd --type f --max-depth 10";
  #   changeDirWidgetCommand = "fd --type d --max-depth 10";
  #   fileWidgetCommand = "fd --type f --max-depth 10";
  #   defaultOptions = [
  #     "--height 40%"
  #     "--layout=reverse"
  #     "--info=inline"
  #     "--preview-window=:hidden"
  #     "--color bg:#080808"
  #     "--color bg+:#262626"
  #     "--color border:#2e2e2e"
  #     "--color fg:#b2b2b2"
  #     "--color fg+:#e4e4e4"
  #     "--color gutter:#262626"
  #     "--color header:#80a0ff"
  #     "--color hl+:#f09479"
  #     "--color hl:#f09479"
  #     "--color info:#cfcfb0"
  #     "--color marker:#f09479"
  #     "--color pointer:#ff5189"
  #     "--color prompt:#80a0ff"
  #     "--color spinner:#36c692"
  #     "--prompt='~ ' --pointer='▶' --marker='✓'"
  #     "--bind '?:toggle-preview'"
  #     "--bind 'ctrl-a:select-all'"
  #     "--bind 'ctrl-y:execute-silent(echo {+} | wl-copy)'"
  #     "--bind 'ctrl-e:execute(echo {+} | xargs -o nvim)'"
  #   ];
  # };
  #
  # programs.zoxide = {
  #   enable = true;
  #   enableBashIntegration = true;
  #   enableZshIntegration = true;
  #   enableFishIntegration = true;
  #   options = [
  #     "--cmd cd"
  #   ];
  # };
  #
  # home.packages = with pkgs; [
  #   btop
  #   fd
  #   ripgrep
  #   duf
  #   tldr
  #   tree
  #   qbittorrent
  # ];
}
