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
      android-tools
    ];
    programs.dconf.enable  = true;
    programs.direnv.enable = true;
  };
}
