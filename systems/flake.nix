{
  description = "Global flake for system setups";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = { self, nixpkgs, nixos-hardware }: let
    system = "x86_64-linux";
    pkg = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };
    };
  in 
  {
    nixosConfigurations = {
      Ruby = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit system; };
        modules = [
          ./ruby.nix
          nixos-hardware.nixosModules.common-cpu-amd
          nixos-hardware.nixosModules.lenovo-thinkpad-p14s-amd-gen2
# ./nixos/configuration.nix
        ];
      };
    };
  };
}
