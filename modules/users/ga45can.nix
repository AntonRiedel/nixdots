{ ... }:
{
  # Home Manager config
  flake.modules.homeManager.ga45can =
    { ... }:
    {
      home = {
        username = "ga45can";
        homeDirectory = "/home/ktas/ga45can";
        stateVersion = "25.11";
      };
      fonts.fontconfig.enable = true;
      programs.home-manager.enable = true;
    };
}
