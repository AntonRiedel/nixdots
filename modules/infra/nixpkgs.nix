# Shared nixpkgs config applied to every nixosSystem.
# Adds pkgs.unstable as an overlay so any module can use
# pkgs.unstable.foo without needing specialArgs.
{ inputs, ... }: {
  flake.modules.nixos.nixpkgs = { ... }: {
    nixpkgs = {
      config.allowUnfree = true;
      overlays = [
        (_final: _prev: {
          unstable = inputs.nixpkgs-unstable.legacyPackages."x86_64-linux";
        })
      ];
    };
  };
}
