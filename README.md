# Install Nix 
# The multi-user Nix installation creates system users, and a system service for the Nix daemon.
sh <(curl -L https://nixos.org/nix/install) --daemon

# Create configuration directory for nix
mkdir -p ~/.config/nix

# Enable experimental features nix-command and flakes to bootstrap.
cat <<EOF > ~/.config/nix/nix.conf
experimental-features = nix-command flakes
EOF
