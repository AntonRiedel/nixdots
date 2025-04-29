{ pkgs, pkgs-unstable, ... }:
{
  programs.neovim = {
    # package = pkgs-unstable.neovim-unwrapped;
    # package = pkgs-unstable.neovim;
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  # home.packages = with pkgs-unstable; [
  home.packages = with pkgs; [
    tree-sitter
    nodejs
  ];

  xdg.configFile."nvim" = {
    source = ./nvim;
    recursive = true;
  };
}
