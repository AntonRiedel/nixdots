{ config, pkgs, ... }:
{
  home.username = "anton";
  home.homeDirectory = "/home/anton";
  home.stateVersion = "23.11"; # Please read the comment before changing.

  imports =
    [
      ./modules/common.nix
      ./modules/laptop.nix
    ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
