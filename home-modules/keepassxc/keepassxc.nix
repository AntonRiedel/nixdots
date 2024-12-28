{ pkgs, pkgs-unstable, ... }:
{
  home.packages = [
    pkgs.keepassxc
    pkgs-unstable.keepmenu
  ];
  home.file = {
    ".config/keepmenu" = {
      source = ./keepmenu;
      recursive = true;
    };
  };
}
