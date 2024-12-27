{ pkgs, ... }:

{
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
    # go
    # gopls
    python3
    rustup

    ccls
    cmake-language-server
    lua-language-server
    nodePackages.bash-language-server
    nodePackages.eslint
    nodePackages.prettier
    pyright
    nodePackages.typescript
    nodePackages.typescript-language-server
    vscode-langservers-extracted
    yaml-language-server
  ];
}
