{ pkgs, ... }:
{
  services.printing = {
    enable = true;
    # Set up the client to connect to the remote CUPS server
    # client.conf = ''
    #   ServerName cups.e12.ph.tum.de
    # '';
  };
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  services.system-config-printer.enable = true;
  programs.system-config-printer.enable = true;
}
