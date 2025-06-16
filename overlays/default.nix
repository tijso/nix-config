{ inputs, ... }:
{
  # Custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs { pkgs = final; };

  # Niri overlay from the flake
  niri = inputs.niri.overlays.niri;

  # Your custom modifications
  modifications = final: prev: {
    # Example: Override a package
    # firefox = prev.firefox.override { enablePlasmaBrowserIntegration = true; };
  };
}
