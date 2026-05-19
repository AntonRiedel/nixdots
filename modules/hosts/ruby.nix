{
  config,
  inputs,
  lib,
  ...
}:
let
  nixos = config.flake.modules.nixos;
  hm = config.flake.modules.homeManager;
in
{
  configurations.nixos.ruby.module = {
    imports = [

      inputs.home-manager.nixosModules.home-manager

      # hardware settings
      inputs.nixos-hardware.nixosModules.lenovo-thinkpad-p14s-amd-gen2

      nixos.boot
      nixos.ruby-filesystem
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
    networking.hostName = "ruby";

    # fix during next reinstall
    boot.loader.efi.efiSysMountPoint = lib.mkForce "/boot/efi";

    boot.initrd.availableKernelModules = [
      "nvme"
      "xhci_pci"
      "usb_storage"
      "sd_mod"
      "rtsx_pci_sdmmc"
      "btrfs"
    ];

    boot.initrd.systemd.enable = true;
    boot.initrd.kernelModules = [
      "amdgpu"
    ];
    boot.kernelModules = [ "kvm-amd" ];

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
        hm.git
        hm.neovim
        hm.gui-packages
        hm.cli-packages
        hm.dev-packages
        hm.work-packages
      ];
    };
  };
}
