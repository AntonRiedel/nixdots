{ config, lib, ... }:
{
  imports = [
    # system specific includes
    ./hardware.nix
    ./boot.nix
    ./filesystem.nix
    ./networking.nix
    ./user.nix
    ./misc.nix

    # common modules
    ../../system-modules/gui/qtile.nix
    ../../system-modules/packages/packages.nix
    ../../system-modules/packages/extra-packages.nix
    ../../system-modules/dual-function-keys/dual-function-keys.nix
    ../../system-modules/virtualization/virtualization.nix
  ];

  nixpkgs.config.allowUnfree = true;

  nix.extraOptions = ''
    experimental-features = nix-command flakes
    trusted-users = root anton
  '';

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
