{pkgs, ...}: {
  imports = [
    ./cli
    ./terminals
    ./editors
    ./desktop
  ];

  home.packages = with pkgs; [
    tree
    btop
    logseq
    inkscape
    ookla-speedtest
    gnome-disk-utility
    obs-studio
    baobab
    cava
    telegram-desktop
    gimp
    corefonts
    cachix
    qbittorrent
    jamesdsp
    megasync
    vesktop
    ani-cli
  ];

  programs.git = {
    enable = true;
    userName = "Joey Sonnier";
    userEmail = "tijso@protonmail.com";
    extraConfig = {
      core.editor = "nvim";
    };
    aliases = {
      a = "!git add . && git status";
      d = "difftool";
      lg = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit";
      pu = "push";
      co = "checkout";
      cm = "commit";
    };
    extraConfig = {
      diff.tool = "vimdiff";
    };
  };
}
