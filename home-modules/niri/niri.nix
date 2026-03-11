{ pkgs, config, ... }:
{
  # home.packages = with pkgs; [
  # ];
  xdg.configFile."niri/config.kdl".source = ./niri/config.kdl;
}
