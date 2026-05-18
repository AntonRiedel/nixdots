{
  description = "System Flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware";
  };
  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable, # <--
      home-manager,
      nixos-hardware,
      ...
    }@inputs:
    let
      system = "x86_64-linux";

      pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};

      commonNixpkgsModule = {
        nixpkgs = {
          inherit system;
          config.allowUnfree = true;
        };
      };

      mkHmModule = user: homePath: {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          backupFileExtension = "bak";
          extraSpecialArgs = { inherit inputs system pkgs-unstable; };
          users.${user} = import homePath;
        };
      };

      mkSystem =
        {
          hardwareModules,
          systemPath,
          homePath,
          user ? "anton",
        }:
        nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs system pkgs-unstable; };
          modules = [
            commonNixpkgsModule
            home-manager.nixosModules.home-manager
            (mkHmModule user homePath)
            systemPath
          ]
          ++ hardwareModules;
        };

      mkHome =
        modulePath:
        home-manager.lib.homeManagerConfiguration {
          extraSpecialArgs = { inherit inputs pkgs-unstable; };
          pkgs = nixpkgs.legacyPackages.${system};
          modules = [ modulePath ];
        };

    in
    {
      nixosConfigurations = {
        diamond = mkSystem {
          hardwareModules = [
            nixos-hardware.nixosModules.common-cpu-amd
            nixos-hardware.nixosModules.common-gpu-amd-sea-islands
          ];
          systemPath = ./systems/diamond/diamond.nix;
          homePath = ./systems/diamond/home.nix;
        };
        ruby = mkSystem {
          hardwareModules = [
            nixos-hardware.nixosModules.lenovo-thinkpad-p14s-amd-gen2
          ];
          systemPath = ./systems/ruby/ruby.nix;
          homePath = ./systems/ruby/home.nix;
        };
        sapphire = mkSystem {
          hardwareModules = [
            nixos-hardware.nixosModules.framework-12-13th-gen-intel
          ];
          systemPath = ./systems/sapphire/sapphire.nix;
          homePath = ./systems/sapphire/home.nix;
        };
      };

      homeConfigurations = {
        "anton@silver" = mkHome ./systems/silver/silver.nix;
        "ga45can@kta" = mkHome ./systems/kta/kta.nix;
      };
    };
}
