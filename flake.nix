{
  description = "System-Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

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
    grub2-themes.url = "github:vinceliuice/grub2-themes";

    # Development
    nixvim.url = "github:tijso/nixvim";
    ghostty.url = "github:ghostty-org/ghostty";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      systems,
      nixvim,
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
            inputs.nixos-cosmic.nixosModules.default
            inputs.grub2-themes.nixosModules.default
            # inputs.stylix.nixosModules.stylix
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
            inputs.niri.homeModules.niri
            inputs.hyprland.homeManagerModules.default
            inputs.nix-colors.homeManagerModules.default
            # inputs.stylix.homeManagerModules.stylix
          ];
        };
      };
    };
}
