{
  config,
  pkgs,
  lib,
  ...
}:
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
    # ../../system-modules/gui/hyprland.nix
    ../../system-modules/gui/gnome.nix
    ../../system-modules/packages/packages.nix
    ../../system-modules/dual-function-keys/dual-function-keys.nix
    # ../../system-modules/flatpak/flatpak.nix
    # ../../system-modules/auto-cpufreq/auto-cpufreq.nix
    ../../system-modules/tailscale/tailscale.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nix.extraOptions = "experimental-features = nix-command flakes";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?
}
