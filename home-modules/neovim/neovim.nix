{ pkgs, pkgs-unstable, ... }:
{
  programs.neovim = {
    package = pkgs-unstable.neovim-unwrapped;
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };
  xdg.configFile."nvim" = {
    source = ./nvim;
    recursive = true;
  };
}
