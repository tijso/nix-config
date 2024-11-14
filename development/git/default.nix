{ pkgs, ... }:

{
  imports = [
    ./lazy_git.nix
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

  environment.systemPackages = with pkgs; [
    autoconf
    coreutils-full
    gcc
    libgcc
    meson
    ncurses
    ninja
    openssl

    elixir
    go
    python3
    rustup

    ccls
    cmake-language-server
    gopls
    lua-language-server
    nodePackages.bash-language-server
    nodePackages.eslint
    nodePackages.prettier
    # nodePackages_latest.pyright
    pyright
    nodePackages.typescript
    nodePackages.typescript-language-server
    vscode-langservers-extracted
    yaml-language-server
  ];
}
