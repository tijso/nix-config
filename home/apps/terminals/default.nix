{ pkgs, config, ... }:

{
  imports = [
    ./kitty.nix
    ./wezterm.nix
    # ./foot.nix
  ];
}
