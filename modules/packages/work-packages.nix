# home-modules/packages/cli-packages.nix
{ ... }:
{
  flake.modules.homeManager.work-packages =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        thunderbird
        mattermost-desktop
        eduvpn-client
        remmina
	zoom-us
      ];
    };
}
