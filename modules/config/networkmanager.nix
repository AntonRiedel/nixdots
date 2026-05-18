{ ... }:
{
  flake.modules.nixos.networkmanager =
    { pkgs, ... }:
    {
      networking.networkmanager = {
        enable = true;
        plugins = [ pkgs.networkmanager-openvpn ];
      };
      programs.nm-applet.enable = true;
    };
}
