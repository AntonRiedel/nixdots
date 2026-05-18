# Common nix daemon settings shared across all machines.
{ ... }: {
  flake.modules.nixos.nix-settings = { ... }: {
    nix.settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store   = true;
      trusted-users         = [ "@wheel" ]; # any wheel member, not a hardcoded user
    };
  };
}
