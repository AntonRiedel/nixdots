{ config, pkgs, ... }:
{
  home.username = "ga45can";
  home.homeDirectory = "/home/ktas/ga45can";
  home.stateVersion = "24.11"; # Please read the comment before changing.

  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  imports =
    [
      ../../home-modules/shell/bash.nix
      ../../home-modules/shell/alias.nix
      ../../home-modules/packages/cli-packages.nix
      ../../home-modules/neovim/neovim.nix
      ../../home-modules/git/git.nix
    ];

  programs.direnv.enable = true;
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
