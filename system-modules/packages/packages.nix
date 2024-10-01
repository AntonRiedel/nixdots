{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # minmal packages for root user
    neovim
    git
    curl
    wget
    openssh

    # hardware
    lm_sensors
    brightnessctl
    acpid
    acpi
    pciutils
  ];
  programs.adb.enable = true;
  programs.dconf.enable = true;
  programs.direnv.enable = true;
}
