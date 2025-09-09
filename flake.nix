{
  description = "System Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    auto-cpufreq = {
      url = "github:AdnanHodzic/auto-cpufreq";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      auto-cpufreq,
      nixos-hardware,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations = {
        diamond = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs system; };
          modules = [
            {
              nixpkgs = {
                inherit system;
                config.allowUnfree = true;
              };
            }
            nixos-hardware.nixosModules.common-cpu-amd
            nixos-hardware.nixosModules.common-gpu-amd-sea-islands
            ./systems/diamond/diamond.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "bak";
              home-manager.extraSpecialArgs = { inherit inputs system; };
              home-manager.users.anton = import ./systems/diamond/home.nix;
            }
          ];
        };

        ruby = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs system; };
          modules = [
            {
              nixpkgs = {
                inherit system;
                config.allowUnfree = true;
              };
            }
            nixos-hardware.nixosModules.lenovo-thinkpad-p14s-amd-gen2
            auto-cpufreq.nixosModules.default
            ./systems/ruby/ruby.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "bak";
              home-manager.extraSpecialArgs = { inherit inputs system; };
              home-manager.users.anton = import ./systems/ruby/home.nix;
            }
          ];
        };

        sapphire = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs system; };
          modules = [
            {
              nixpkgs = {
                inherit system;
                config.allowUnfree = true;
              };
            }
            nixos-hardware.nixosModules.framework-12-13th-gen-intel
            auto-cpufreq.nixosModules.default
            ./systems/sapphire/sapphire.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "bak";
              home-manager.extraSpecialArgs = { inherit inputs system; };
              home-manager.users.anton = import ./systems/sapphire/home.nix;
            }
          ];
        };
      };

      homeConfigurations."anton@silver" = home-manager.lib.homeManagerConfiguration {
        extraSpecialArgs = { inherit inputs; };
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [
          ./systems/silver/silver.nix
        ];
      };

      homeConfigurations."ga45can@kta" = home-manager.lib.homeManagerConfiguration {
        extraSpecialArgs = { inherit inputs; };
        pkgs = nixpkgs.legacyPackages.${system}; 
        modules = [
          ./systems/kta/kta.nix
        ];
      };
    };
}
