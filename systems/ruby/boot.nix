{ config, pkgs, ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.kernelPackages = pkgs.linuxPackages;
  boot.kernelParams = [ "amdgpu.dcdebugmask=0x400" ];
  # boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.initrd.availableKernelModules = [
    "nvme"
    "xhci_pci"
    "usb_storage"
    "sd_mod"
    "rtsx_pci_sdmmc"
    "btrfs"
    "evdi"
  ];

  boot.initrd.systemd.enable = true;
  boot.initrd.kernelModules = [
    "amdgpu"
    "evdi"
  ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ config.boot.kernelPackages.evdi ];
}
