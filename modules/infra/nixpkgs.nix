{ inputs, lib, ... }:
{
  options.pkgs = lib.mkOption {
    type = lib.types.attrs;
    default = import inputs.nixpkgs {
      system = "x86_64-linux";
      config.allowUnfree = true;
      overlays = [
        (_final: _prev: {
          unstable = inputs.nixpkgs-unstable.legacyPackages."x86_64-linux";
        })
      ];
    };
  };

  config.flake.modules.nixos.nixpkgs =
    { ... }:
    {
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
