{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    lutris
    mangohud
  ];

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  services.flatpak.enable = true;

  programs.gamemode.enable = true;

}
