# home-modules/packages/cli-packages.nix
{ ... }:
{
  flake.modules.homeManager.cli-packages =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        htop
        fd
        ripgrep
        trash-cli
        yazi
        zip
        unzip
      ];
    };
}
