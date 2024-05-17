{
  description = "Home Manager configuration of anton";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      # pkgs = nixpkgs.legacyPackages.${system};
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      overlays = [
         inputs.neovim-nightly-overlay.overlay
      ];
    };
    in {
      homeConfigurations."anton@ruby" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ 
	  ./ruby.nix
	  ];
      };

      homeConfigurations."anton@silver" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ 
	  ./silver.nix
	  ];
      };

      homeConfigurations."ga45can@kta" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ 
	  ./kta.nix
	  ];
      };
    };
}
