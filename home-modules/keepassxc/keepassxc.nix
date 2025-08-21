{ pkgs, ... }:
{
  home.packages = [
    pkgs.keepassxc
    pkgs.keepmenu
  ];
  home.file = {
    ".config/keepmenu" = {
      source = ./keepmenu;
      recursive = true;
    };
  };
}
