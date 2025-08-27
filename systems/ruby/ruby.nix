{ pkgs, ... }:
{
  imports = [
    ./hardware.nix
    ./boot.nix
    ./filesystem.nix
    ./networking.nix
    ./user.nix
    ./misc.nix

    # common modules
    ../../system-modules/gui/hyprland.nix
    # ../../system-modules/printing/print-work.nix
    ../../system-modules/packages/packages.nix
    ../../system-modules/dual-function-keys/dual-function-keys.nix
    ../../system-modules/virtualization/virtualization.nix
    ../../system-modules/auto-cpufreq/auto-cpufreq.nix
  ];

  environment.systemPackages = with pkgs; [
    neovim
    git
    curl
    wget
  ];

  nix.settings = {
    experimental-features = "nix-command flakes";
    auto-optimise-store = true;
    trusted-users = [ "anton" ];
  };

  system.stateVersion = "25.05";
}
