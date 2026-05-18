# Base system packages and common programs for all machines.
{ ... }: {
  flake.modules.nixos.packages = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      neovim
      git
      curl
      wget
      openssh
      lm_sensors
      brightnessctl
      pciutils
    ];
    programs.adb.enable    = true;
    programs.dconf.enable  = true;
    programs.direnv.enable = true;
  };
}
