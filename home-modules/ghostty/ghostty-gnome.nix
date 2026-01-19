{ inputs, pkgs, ... }:
{
  home.packages = [
    pkgs.ghostty
  ];
  home.file = {
    ".config/ghostty" = {
      source = ./ghostty-gnome;
      recursive = true;
    };
  };
}
