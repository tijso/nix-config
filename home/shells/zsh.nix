{ pkgs, config, ... }:

{
  programs.zsh = {
    enable                    = true;
    autocd                    = true;
    enableCompletion          = true;
    autosuggestion.enable     = true;
    syntaxHighlighting.enable = true;
    history ={
      expireDuplicatesFirst = true;
      ignoreDups = true;
      ignoreSpace = true;
      size = 5000;
      save = 5000;  
      path = "$HOME/.cache/zsh_history";
    };
    initExtra = ''
        bindkey -e
        bindkey '^p' history-search-backward
        bindkey '^n' history-search-forward
        zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
        zstyle ':completion:*' menu no
    '';
    shellAliases = {
      ls = "eza -l";
      la = "eza -la";
      lt = "eza --tree";
      tl = "trash-list";
      te = "trash-empty";
      tr = "trash-restore";
      tm = "trash-rm";
      cat = "bat -p";
      vim = "nvim";
      update  = "sudo nix flake update";
      rebuild = "sudo nixos-rebuild switch --flake .";
      hmu = "nix flake lock --update-input home-manager .";
      hmr = "home-manager switch --flake .";
    };
  };
}
