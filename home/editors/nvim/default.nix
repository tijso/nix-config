{ pkgs, inputs, config, lib, ...}:

{
  imports = [
    ./plugins
    ./options.nix
    ./autocmd.nix
    ./keymaps.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };
}
