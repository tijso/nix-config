{ inputs, ... }:
{
  # Custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs { pkgs = final; };

  # Niri overlay from the flake
  niri = inputs.niri.overlays.niri;

  modifications = final: prev: {
    mpd = prev.mpd.overrideAttrs (oldAttrs: {
      mesonFlags = (oldAttrs.mesonFlags or [ ]) ++ [
        "-Dio_uring=disabled"
      ];
    });
  };
}
