{
  description = "Your new nix config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Flakes
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    systems.url = "github:nix-systems/default-linux";

    nixos-cosmic = {
      url = "github:lilyinstarlight/nixos-cosmic";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hyprland
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    # Niri
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Theming
    nix-colors.url = "github:misterio77/nix-colors";

    # stylix = {
    #   url = "github:danth/stylix";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    grub2-themes = {
      url = "github:vinceliuice/grub2-themes";
    };

    # My Nvim Config
    # nvim.url = "github:tijso/nvim";
    # neovim-nightly-overlay = {
    #   url = "github:nix-community/neovim-nightly-overlay";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # Nixvim
    nixvim.url = "github:tijso/nixvim";

    # Terminal
    ghostty = {
      url = "github:ghostty-org/ghostty";
    };

  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      systems,
      nix-colors,
      nixos-cosmic,
      # neovim-nightly-overlay,
      nixvim,
      niri,
      hyprland,
      grub2-themes,
      # stylix,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      lib = nixpkgs.lib // home-manager.lib;
      forEachSystem = f: lib.genAttrs (import systems) (system: f pkgsFor.${system});
      pkgsFor = lib.genAttrs (import systems) (
        system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
          overlays = builtins.attrValues (import ./overlays { inherit inputs; });
        }
      );
    in
    {
      inherit lib;
      overlays = import ./overlays { inherit inputs; };
      packages = forEachSystem (pkgs: import ./pkgs { inherit pkgs; });
      devShells = forEachSystem (pkgs: import ./shell.nix { inherit pkgs; });
      formatter = forEachSystem (pkgs: pkgs.alejandra);

      nixosConfigurations = {
        serenity = lib.nixosSystem {
          pkgs = pkgsFor.x86_64-linux;
          specialArgs = {
            inherit inputs outputs;
          };
          modules = [
            ./hosts/serenity
            {
              nix.settings = {
                substituters = [ "https://cosmic.cachix.org/" ];
                trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" ];
              };
            }
            nixos-cosmic.nixosModules.default
            grub2-themes.nixosModules.default
            # stylix.nixosModules.stylix
          ];
        };
      };

      homeConfigurations = {
        "tijso@serenity" = lib.homeManagerConfiguration {
          pkgs = pkgsFor.x86_64-linux;
          extraSpecialArgs = {
            inherit inputs outputs;
          };
          modules = [
            ./hosts/serenity/home.nix
            niri.homeModules.niri
            hyprland.homeManagerModules.default
          ];
        };
      };
    };
}
