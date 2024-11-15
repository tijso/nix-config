{ pkgs, ... }:
{
  home.packages = with pkgs; [
    autoconf
    libgcc
    meson
    ncurses
    ninja
    openssl
    spread

    elixir
    gnumake
    gcc

    nodejs
    nodePackages_latest.prettier

    # cmake-language-server
    # lua-language-server
    #
    # nodePackages.bash-language-server
    # nodePackages.eslint
    # nodePackages.prettier
    # nodePackages.typescript
    # nodePackages.typescript-language-server
    #
    # vscode-langservers-extracted
    #
    # yaml-language-server

    # Nix
    nh
    nix-du
    nix-prefetch-git
    nix-prefetch-github
    # nixfmt
    alejandra
    nil

    # Rust
    cargo
    rust-analyzer
    rustfmt
    rustc

    # Python 
    pyright
    ruff
    uv
    (pkgs.python3.withPackages (
      p: with p; [
        tox
        virtualenv
      ]
    ))
  ];
}
