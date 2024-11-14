{ pkgs, ... }:
{
  imports = [
    ./git
  ];

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
