{ config, pkgs, ... }:
{
  home.username = "anton";
  home.homeDirectory = "/home/anton";
  home.stateVersion = "25.05"; # Please read the comment before changing.

  nix = {
    package = pkgs.nix;
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  imports = [
    ../../home-modules/shell/bash.nix
    ../../home-modules/shell/alias.nix
    ../../home-modules/packages/cli-packages.nix
    ../../home-modules/neovim/neovim.nix
    ../../home-modules/tmux/tmux.nix
    ../../home-modules/fzf/fzf.nix
    ../../home-modules/git/git.nix
  ];

  programs.direnv.enable = true;
  home.sessionVariables = {
    ALICE = "~/alice";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
