{ pkgs, ... }:

{
  imports = [
    ./lazy_git.nix
    ./github.nix
  ];

  programs.git = {
    enable = true;
    userName = "Joey Sonnier";
    userEmail = "tijso@protonmail.com";
    aliases = {
      a = "!git add . && git status";
      lg = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit";
      pu = "push";
      co = "checkout";
      cm = "commit";
    };
    extraConfig = {
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      pull.rebase = true;
    };
  };
}
