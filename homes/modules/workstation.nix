{ pkgs, lib, config, ... }:
{
  # more packages
  home.packages = with pkgs; [
    lua51Packages.lua
    lua51Packages.luarocks
    fswatch
    nerdfonts
  ];

  programs = {
    git = {
      enable = true;
      userEmail = "anton.riedel@cern.ch";
      userName = "Anton Riedel";
    };
  };

  # symlinks
  # xdg.configFile."tmuxp" = {
  #     enable = true;
  #     source = "${config.xdg.configHome}/home-manager/modules/tmuxp";
  #     recursive = true;
  # };

  home.file = {
    ".config/tmuxp" = {
      source = ./tmuxp;
      recursive = true;
    };
  };

  home.sessionVariables = {
    ALICE = "$HOME/alice";
  };
}
