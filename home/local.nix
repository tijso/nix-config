{
  pkgs,
  ...
}: {
  imports = [
    nix-colors.homeManagerModules.default
    ./cli
    ./terminals
    ./editors
    ./desktop
  ];

  colorScheme = nix-colors.colorSchemes.catppuccin-mocha;


  }
