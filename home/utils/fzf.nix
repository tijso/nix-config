{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
{
  options.fzf.enable = mkEnableOption "fzf configuration";

  config = mkIf config.fzf.enable {
    home.packages = with pkgs; [
      fzf
    ];
    programs.fzf = {
      enable = true;
      catppuccin.enable = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
      defaultCommand = "fd --type file --hidden --follow --exclude .git";
      fileWidgetCommand = "fd --type file --hidden --follow --exclude .git";
      changeDirWidgetCommand = "fd --type directory --hidden --follow --exclude .git";

      defaultOptions = [
        "--height 50%"
        "--layout=reverse"
        "--border"
        "--info=inline"
        "--prompt='❯ '"
        "--pointer='▶'"
        "--marker='✓'"
        "--cycle"
        # History settings
        "--history=${config.xdg.dataHome}/fzf/history"
        "--history-size=10000"
        # Preview settings
        "--preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (eza --tree {} | less)) || echo {} 2> /dev/null | head -200'"
        "--preview-window=right:60%:wrap"
        # Color scheme
        # "--color=fg:#d0d0d0,bg:#121212,hl:#5f87af"
        # "--color=fg+:#d0d0d0,bg+:#262626,hl+:#5fd7ff"
        # "--color=info:#afaf87,prompt:#d7005f,pointer:#af5fff"
        # "--color=marker:#87ff00,spinner:#af5fff,header:#87afaf"
      ];
    };

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

    # Custom functions for different shells
    programs.zsh.initExtra = ''
      # fuzzy grep with preview and open in editor
      fzgrep() {
        rg --line-number . | fzf --delimiter : \
          --preview 'bat --style=numbers --color=always --highlight-line {2} {1}' \
          --preview-window up,60%,border-bottom,+{2}+3/3 \
          --bind 'enter:become($EDITOR {1} +{2})'
      }

      # fuzzy git checkout
      fco() {
        git branch --all | grep -v HEAD | fzf --preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" $(sed "s/.* //" <<< {})' | sed "s/.* //"
      }

      # fuzzy git log
      fgl() {
        git log --graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" | \
        fzf --ansi --no-sort --reverse --tiebreak=index --preview \
        'f() { set -- $(echo -- "$@" | grep -o "[a-f0-9]\{7\}"); [ $# -eq 0 ] || git show --color=always $1; }; f {}' \
        --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
                FZF-EOF"
      }
    '';

    programs.fish.functions = {
      # Fish version of fzgrep
      fzgrep = ''
        rg --line-number . | fzf --delimiter : \
          --preview 'bat --style=numbers --color=always --highlight-line {2} {1}' \
          --preview-window up,60%,border-bottom,+{2}+3/3 \
          --bind "enter:become($EDITOR {1} +{2})"
      '';

      # Fish version of fco
      fco = ''
        git branch --all | grep -v HEAD | fzf --preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" (string split -f2 " " {})' | string split -f2 " "
      '';
    };

  };
}
