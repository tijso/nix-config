{
  programs.fzf = {
    enable = true;
    catppuccin.enable = true;
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
}
