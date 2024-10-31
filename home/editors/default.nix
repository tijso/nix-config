{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./nvim
    # ./helix
  ];
}
