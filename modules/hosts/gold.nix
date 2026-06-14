{ config, inputs, ... }:
let
  nixos = config.flake.modules.nixos;
  hm = config.flake.modules.homeManager;
in
{
  configurations.nixos.gold.module = {
    imports = [

      inputs.home-manager.nixosModules.home-manager

      # hardware settings
      inputs.nixos-hardware.nixosModules.lenovo-thinkpad-x220
      nixos.boot
      nixos.gold
      nixos.networkmanager
      nixos.audio
      nixos.bluetooth
      nixos.locale

      # nix settings
      nixos.nix-settings
      nixos.nixpkgs
      nixos.home-manager-defaults
      nixos.nh

      # user settings
      nixos.user-anton

      # packages
      # nixos.niri
      nixos.hyprland
      nixos.packages
      nixos.gaming
      nixos.dual-function-keys
      nixos.virtualization
      nixos.tailscale
      nixos.fwupd
    ];

    # host settings h
    networking.hostName = "gold";
    boot.initrd.availableKernelModules = [
      "ehci_pci"
      "ahci"
      "usb_storage"
      "sd_mod"
      "sdhci_pci"
    ];
    hardware.enableRedistributableFirmware = true;
    hardware.cpu.intel.updateMicrocode = true;
    boot.kernelModules = [
      "i915"
      "kvm-intel"
    ];
    services.xserver.videoDrivers = [ "intel" ];

    nixpkgs.hostPlatform = "x86_64-linux";
    system.stateVersion = "26.05";
    home-manager.users.anton = {
      imports = [
        hm.anton
        hm.hyprland
        hm.audio
        hm.ghostty
        hm.bash
        hm.alias
        hm.tmux
        hm.fzf
        hm.git
        hm.neovim
        hm.gui-packages
        hm.cli-packages
        hm.dev-packages
      ];
    };
  };
}
