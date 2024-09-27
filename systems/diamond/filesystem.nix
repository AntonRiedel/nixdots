{
  config,
  pkgs,
  lib,
  ...
}:
{
  fileSystems."/" = {
    label = "NIXOS";
    fsType = "btrfs";
    options = [
      "subvol=@root"
      "compress=zstd"
    ];
  };
  fileSystems."/home" = {
    label = "NIXOS";
    fsType = "btrfs";
    options = [
      "subvol=@home"
      "compress=zstd"
    ];
  };
  fileSystems."/nix" = {
    label = "NIXOS";
    fsType = "btrfs";
    options = [
      "subvol=@nix"
      "compress=zstd"
    ];
  };
  fileSystems."/steam" = {
    label = "SCRATCH";
    fsType = "btrfs";
    options = [
      "subvol=@steam"
      "compress=zstd"
    ];
  };

  fileSystems."/boot" = {
    label = "UEFI";
    fsType = "vfat";
    options = [
      "fmask=0077"
      "dmask=0077"
      "defaults"
    ];
  };

}
