# modules/users/anton.nix
{ ... }:
{
  # NixOS system user
  flake.modules.nixos.user-anton =
    { ... }:
    {
      users.users.anton = {
        isNormalUser = true;
        description = "anton";
        extraGroups = [
          "wheel"
          "networkmanager"
          "libvirtd"
          "input"
          "adbusers"
        ];
      };
    };

  # Home Manager config
  flake.modules.homeManager.anton =
    { ... }:
    {
      home = {
        username = "anton";
        homeDirectory = "/home/anton";
        stateVersion = "26.05";
      };
      fonts.fontconfig.enable = true;
      programs.home-manager.enable = true;
    };
}
