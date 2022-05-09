# The multi-user Nix installation creates system users, and a system service for the Nix daemon.
`sh <(curl -L https://nixos.org/nix/install) --daemon`

# Create configuration directory for nix
`mkdir -p ~/.config/nix`

# Enable experimental features nix-command and flakes to bootstrap.
```
cat <<EOF > ~/.config/nix/nix.conf
experimental-features = nix-command flakes
EOF
````

# Install Home Manager and apply the configuration by
```
nix build --no-link <flake-uri>#homeConfigurations.rafiyq.activationPackage
"$(nix path-info <flake-uri>#homeConfigurations.rafiyq.activationPackage)"/activate
```

# Building a flake-based configuration once home-manager is installed. (>=21.05)
`home-manager switch --flake '<flake-uri>#rafiyq'`

# Direnv
https://github.com/nix-community/nix-direnv
