{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  home.packages = with pkgs; [
    tree-sitter
    nodejs
  ];

  xdg.configFile."nvim" = {
    source = ./nvim;
    recursive = true;
  };
}
