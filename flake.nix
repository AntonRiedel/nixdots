{
  description = "System Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    auto-cpufreq = {
      url = "github:AdnanHodzic/auto-cpufreq";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    ghostty = {
      url = "github:ghostty-org/ghostty";
    };
  };
  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      auto-cpufreq,
      ghostty,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
    in
    {
      nixosConfigurations = {
        diamond = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit
              inputs
              system
              pkgs
              pkgs-unstable
              ;
          };
          modules = [
            ./systems/diamond/diamond.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "bak";
              home-manager.extraSpecialArgs = {
                inherit
                  inputs
                  system
                  pkgs
                  pkgs-unstable
                  ;
              };
              home-manager.users.anton = import ./systems/diamond/home.nix;
            }
          ];
        };
        ruby = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit
              inputs
              system
              pkgs
              pkgs-unstable
              ;
          };
          modules = [
            ./systems/ruby/ruby.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "bak";
              home-manager.extraSpecialArgs = {
                inherit system pkgs pkgs-unstable;
              };
              home-manager.users.anton = import ./systems/ruby/home.nix;
            }
          ];
        };
        sapphire = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit
              inputs
              system
              pkgs
              pkgs-unstable
              ;
          };
          modules = [
            ./systems/sapphire/sapphire.nix
            auto-cpufreq.nixosModules.default
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "bak";
              home-manager.extraSpecialArgs = {
                inherit system pkgs pkgs-unstable;
              };
              home-manager.users.anton = import ./systems/sapphire/home.nix;
            }
          ];
        };
      };

      homeConfigurations."anton@silver" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit inputs pkgs pkgs-unstable;
        };
        modules = [ ./systems/silver/silver.nix ];
      };
      homeConfigurations."ga45can@kta" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit inputs pkgs pkgs-unstable;
        };
        modules = [ ./systems/kta/kta.nix ];
      };
    };
}
