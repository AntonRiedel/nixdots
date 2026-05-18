# Sets home-manager defaults for every nixosSystem that includes it.
# The homeManager option namespace is also declared here so that
# flake.modules.homeManager.* can be set by any module.
{ inputs, ... }: {
  flake.modules.nixos.home-manager-defaults = { ... }: {
    home-manager = {
      useGlobalPkgs       = true;
      useUserPackages     = true;
      backupFileExtension = "bak";
      extraSpecialArgs    = { inherit inputs; };
    };
  };
}
