{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
      ./hardware.nix
      ./boot.nix
      ./filesystem.nix
      ./networking.nix
      ./user.nix
      ./misc.nix

     # common modules
     ../../system-modules/qtile/qtile.nix
     ../../system-modules/packages/packages.nix
     ../../system-modules/dual-function-keys/dual-function-keys.nix
     ../../system-modules/virtualization/virtualization.nix
  ];

  environment.systemPackages = with pkgs; [
    neovim
    git
    curl
    wget
  ];

  nix.settings = {
    experimental-features = "nix-command flakes";
    auto-optimise-store = true;
  };

  system.stateVersion = "24.05";
}
