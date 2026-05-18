# home-modules/ghostty/ghostty.nix
{ ... }:
{
  flake.modules.homeManager.ghostty =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.ghostty ];
      home.file.".config/ghostty" = {
        source = ./ghostty;
        recursive = true;
      };
    };
}
