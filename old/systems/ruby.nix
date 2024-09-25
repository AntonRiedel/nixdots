{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
      ./modules/boot.nix
      ./modules/hardware.nix
      ./modules/filesystem.nix
      ./modules/networking.nix
      ./modules/misc.nix
      ./modules/packages.nix
      ./modules/gui.nix
      ./modules/user.nix
  ];

  nix.settings = {
    experimental-features = "nix-command flakes";
    auto-optimise-store = true;
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";
}
