{ inputs, ... }:
{
  # Custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs { pkgs = final; };

  # Niri overlay from the flake
  niri = inputs.niri.overlays.niri;

  # Your custom modifications
  modifications = final: prev: {
    mpd = prev.mpd.override {
      ioUringSupport = false;
    };
  };
}
