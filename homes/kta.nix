{ config, pkgs, ... }:
{
  home.username = "ga45can";
  home.homeDirectory = "/home/ktas/ga45can";
  home.stateVersion = "24.05"; # Please read the comment before changing.

  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };


  imports =
    [
      ./modules/common.nix
      ./modules/workstation.nix
    ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
