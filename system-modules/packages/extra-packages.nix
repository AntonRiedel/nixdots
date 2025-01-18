{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    lutris
    mangohud
    cool-retro-term
  ];

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  programs.gamemode.enable = true;

}
