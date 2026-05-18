{ config, inputs, ... }:
let
  nixos = config.flake.modules.nixos;
  hm = config.flake.modules.homeManager;
in
{
  configurations.nixos.sapphire.module = {
    imports = [

      inputs.home-manager.nixosModules.home-manager

      # hardware settings
      inputs.nixos-hardware.nixosModules.framework-12-13th-gen-intel
      nixos.boot
      nixos.sapphire-filesystem
      nixos.networkmanager
      nixos.audio
      nixos.bluetooth
      nixos.locale

      # nix settings
      nixos.nix-settings
      nixos.nixpkgs
      nixos.home-manager-defaults

      # user settings
      nixos.user-anton

      # packages
      # nixos.niri
      nixos.hyprland
      nixos.packages
      nixos.flatpak
      nixos.dual-function-keys
      nixos.virtualization
      nixos.tailscale
      nixos.fwupd
    ];

    # host settings h
    networking.hostName = "sapphire";

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

    hardware.enableRedistributableFirmware = true;
    hardware.cpu.amd.updateMicrocode = true;

    nixpkgs.hostPlatform = "x86_64-linux";
    system.stateVersion = "25.11";
    home-manager.users.anton = {
      imports = [
        hm.anton
        hm.hyprland
        hm.audio
        hm.ghostty
        hm.bash
        hm.tmux
        hm.fzf
        hm.neovim
        hm.gui-packages
        hm.cli-packages
        hm.dev-packages
        hm.work-packages
      ];
    };
  };
}
