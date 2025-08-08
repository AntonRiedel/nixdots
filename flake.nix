{
  description = "System Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    auto-cpufreq = {
      url = "github:AdnanHodzic/auto-cpufreq";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      auto-cpufreq,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgsConfig = {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
      pkgs-unstable = import inputs.nixpkgs-unstable {
        inherit system;
        config = pkgsConfig;
      };
    in
    {
      nixosConfigurations = {
        diamond = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit
              inputs
              system
              pkgs-unstable
              ;
          };
          modules = [
            {
              nixpkgs = {
                inherit system;
                config = pkgsConfig;
              };
            }
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
              pkgs-unstable
              ;
          };
          modules = [
            {
              nixpkgs = {
                inherit system;
                config = pkgsConfig;
              };
            }
            ./systems/ruby/ruby.nix
            auto-cpufreq.nixosModules.default
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "bak";
              home-manager.extraSpecialArgs = {
                inherit
                  inputs
                  system
                  pkgs-unstable
                  ;
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
              pkgs-unstable
              ;
          };
          modules = [
            {
              nixpkgs = {
                inherit system;
                config = pkgsConfig;
              };
            }
            ./systems/sapphire/sapphire.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "bak";
              home-manager.extraSpecialArgs = {
                inherit
                  inputs
                  system
                  ;
              };
              home-manager.users.anton = import ./systems/sapphire/home.nix;
            }
          ];
        };
      };

      homeConfigurations."anton@silver" = home-manager.lib.homeManagerConfiguration {
        extraSpecialArgs = {
          inherit
            inputs
            pkgs-unstable
            ;
        };
        modules = [
          {
            nixpkgs = {
              inherit system;
              config = pkgsConfig;
            };
          }
          ./systems/silver/silver.nix
        ];
      };
      homeConfigurations."ga45can@kta" = home-manager.lib.homeManagerConfiguration {
        extraSpecialArgs = {
          inherit
            inputs
            pkgs-unstable
            ;
        };
        modules = [
          {
            nixpkgs = {
              inherit system;
              config = pkgsConfig;
            };
          }
          ./systems/kta/kta.nix
        ];
      };
    };
}
