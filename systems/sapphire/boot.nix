{
  pkgs,
  ...
}:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.initrd.availableKernelModules = [
    "xhci_pci" # USB3 controller
    "ahci" # SATA controller
    "nvme" # NVMe SSD (root disk on Framework)
    "usb_storage" # USB drives
    "sd_mod" # SCSI/SATA disks
    "rtsx_pci_sdmmc" # SD card reader
  ];
  boot.initrd.kernelModules = [
    "i915" # Intel GPU (for early modesetting, avoids flicker)
    "pinctrl_tigerlake" # Required quirk for Tiger Lake platform
  ];
  boot.kernelModules = [
    "kvm-intel" # Virtualization
    "iwlwifi" # Intel Wi-Fi
    "snd_hda_intel" # Sound
    "btusb" # Bluetooth
  ];

  boot.extraModulePackages = [ ];
}
