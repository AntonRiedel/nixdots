{ config, pkgs, ... }:
{
  home.username = "anton";
  home.homeDirectory = "/home/anton";
  home.stateVersion = "24.05"; # Please read the comment before changing.

  imports =
    [
      ./modules/common.nix
      ./modules/laptop.nix
    ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
