My Personal Configuration

# Clone the github repo
git clone git@github.com:tijso/nix-config.git

# You should probably make your own system configurations for compatibility
# Feel free to edit any files in the repo to suit your needs, otherwise

cd nix-config/hosts/serenity

# Copy your partitions to the hardware-configuration.nix file
cp hardware-configuration.nix

# Build the system configuration
sudo nixos-rebuild switch --flake .#serenity

# Then build the home configuration

# If you haven't installed it yet
nix shell nixpkgs#home-manager

# Then switch the config
home-manager switch --flake .#tijso@serenity
