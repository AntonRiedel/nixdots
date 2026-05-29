{ ... }:
{
  flake.modules.nixos.boot =
    { pkgs, ... }:
    {
      boot.loader.systemd-boot.enable = true;
      boot.initrd.systemd.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;
      boot.loader.efi.efiSysMountPoint = "/boot";
      boot.kernelPackages = pkgs.linuxPackages_latest;
    };
}
