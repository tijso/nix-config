{inputs, ...}: {
  # This one brings our custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs final.pkgs;

  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays
  modifications = final: prev: {
    my_glslang = prev.glslang.overrideAttrs (finalAttrs: oldAttrs: {
      version = "15.0.0";
      src = final.fetchFromGitHub {
        owner = "KhronosGroup";
        repo = "glslang";
        rev = "refs/tags/${finalAttrs.version}";
        hash = "sha256-QXNecJ6SDeWpRjzHRTdPJHob1H3q2HZmWuL2zBt2Tlw=";
      };
      cmakeFlags = [];
    });
    amdvlk = prev.amdvlk.override {
      glslang = final.my_glslang;
    };

  # When applied, the nixpkgs-stable set (declared in the flake inputs) will
  # be accessible through 'pkgs.stable'. Likewise, the nixpkgs-unstable set
  # will be accessible through 'pkgs.unstable'
  stable-packages = final: _prev: {
    stable = import inputs.nixpkgs-stable {
      system = final.system;
      config.allowUnfree = true;
    };
  };

  unstable-packages = final: _prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
}
