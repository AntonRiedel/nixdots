{ inputs, pkgs, ... }:
{
  home.packages = [
    pkgs.ghostty
  ];
  home.file = {
    ".config/ghostty" = {
      source = ./ghostty;
      recursive = true;
    };
  };
}
