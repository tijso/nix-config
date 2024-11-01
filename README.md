My Personal Configuration

git clone git@github.com:tijso/nix-config.git

cd nix-config/hosts/serenity

cp hardware-configuration.nix

sudo nixos-rebuild switch --flake .#serenity

nix shell nixpkgs#home-manager

home-manager switch --flake .#tijso@serenity
