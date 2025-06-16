{ inputs, ... }:
{
  # Stable packages (since you're on unstable, maybe you want stable for some things)
  stable-packages = final: _prev: {
    stable = import inputs.nixpkgs-stable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
}
