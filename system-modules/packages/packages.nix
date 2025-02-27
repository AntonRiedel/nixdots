{ pkgs, pkgs-unstable, ... }:
{
  environment.systemPackages = [
    # minmal packages for root user
    pkgs.neovim
    pkgs.git
    pkgs.curl
    pkgs.wget
    pkgs.openssh

    # hardware
    pkgs.lm_sensors
    pkgs.brightnessctl
    pkgs.acpid
    pkgs.acpi
    pkgs.pciutils
    pkgs.iio-sensor-proxy
  ];
  programs.adb.enable = true;
  programs.dconf.enable = true;
  programs.direnv.enable = true;
}
