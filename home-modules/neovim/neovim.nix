{ pkgs, pkgs-unstable, ... }:
{
  programs.neovim = {
    package = pkgs-unstable.neovim-unwrapped;
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  home.packages = with pkgs-unstable; [
    tree-sitter
    nodejs
  ];

  xdg.configFile."nvim" = {
    source = ./nvim;
    recursive = true;
  };
}
