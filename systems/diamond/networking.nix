{ pkgs, ... }:
{
  networking.hostName = "diamond"; # Define your hostname.
  networking.networkmanager = {
    enable = true;
    plugins = [ pkgs.networkmanager-openvpn ];
  };

  programs.nm-applet.enable = true;
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  # Enable networking
  # networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp8s0.useDHCP = lib.mkDefault true;
}
