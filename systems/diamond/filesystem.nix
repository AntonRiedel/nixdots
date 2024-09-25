{ config, pkgs, lib, ... }:
{
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/7c19e680-035d-47a3-b642-dc1e50746cc1";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/8CC5-A8E2";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/14e68b3b-695e-46c6-8a83-8a720f3f0867"; }
    ];
}
