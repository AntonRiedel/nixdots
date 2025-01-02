{ inputs, pkgs, ... }:
{
  home.packages = [
    inputs.ghostty.packages."${pkgs.system}".default
  ];
  home.file = {
    ".config/ghostty" = {
      source = ./ghostty;
      recursive = true;
    };
  };
}
