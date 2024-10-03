{ ... }:
{
  home.username = "anton";
  home.homeDirectory = "/home/anton";
  home.stateVersion = "24.05"; # Please read the comment before changing.

  fonts.fontconfig.enable = true;

  imports = [
    # common modules
    ../../home-modules/packages/cli-packages.nix
    ../../home-modules/packages/gui-packages.nix
    ../../home-modules/shell/alias.nix
    ../../home-modules/shell/bash.nix
    ../../home-modules/git/git.nix
    ../../home-modules/gpg/gpg.nix
    ../../home-modules/fzf/fzf.nix
    ../../home-modules/neovim/neovim.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
