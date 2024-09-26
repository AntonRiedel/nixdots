{
  description = "System Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    # neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  # outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, neovim-nightly-overlay, ... }@inputs: let
  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
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
            inherit system;
          };
          modules = [
            ./systems/diamond/diamond.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "bak";
              home-manager.extraSpecialArgs = {
                inherit system pkgs pkgs-unstable;
              };
              home-manager.users.anton = import ./systems/diamond/home.nix;
            }
          ];
        };
        ruby = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit system;
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
      };
      homeConfigurations."anton@silver" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit pkgs pkgs-unstable;
        };
        modules = [ ./systems/silver/silver.nix ];
      };
    };
}
