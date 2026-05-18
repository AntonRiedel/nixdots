{ config, inputs, ... }:
let
  nixos = config.flake.modules.nixos;
  hm = config.flake.modules.homeManager;
in
{
  configurations.nixos.diamond.module = {
    imports = [

      inputs.home-manager.nixosModules.home-manager

      # hardware settings
      inputs.nixos-hardware.nixosModules.common-cpu-amd
      inputs.nixos-hardware.nixosModules.common-gpu-amd-sea-islands
      nixos.boot
      nixos.diamond-filesystem
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
      nixos.gaming
      nixos.flatpak
      nixos.dual-function-keys
      nixos.virtualization
      nixos.tailscale
      nixos.fwupd
    ];

    # host settings h
    networking.hostName = "diamond";
    boot.initrd.availableKernelModules = [
      "xhci_pci"
      "ahci"
      "usbhid"
      "usb_storage"
      "sd_mod"
    ];
    boot.kernelModules = [ "kvm-amd" ];
    hardware.enableRedistributableFirmware = true;
    hardware.cpu.amd.updateMicrocode = true;
    services.xserver.videoDrivers = [ "amdgpu" ];

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
        hm.gaming
      ];
    };
  };
}
