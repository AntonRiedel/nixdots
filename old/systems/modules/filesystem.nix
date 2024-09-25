{
  # root
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/7fa08817-7609-421b-a3ff-9e0d1c4eb1da";
      fsType = "btrfs";
      options = [ "subvol=root" "compress=zstd:1" "ssd" "autodefrag" "discard=async" ];
    };

  # home
  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/7fa08817-7609-421b-a3ff-9e0d1c4eb1da";
      fsType = "btrfs";
      options = [ "subvol=home" "compress=zstd:1" "ssd" "autodefrag" "discard=async" ];
    };

  # nix store
  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/7fa08817-7609-421b-a3ff-9e0d1c4eb1da";
      fsType = "btrfs";
      options = [ "subvol=nix" "compress=zstd:1" "noatime" "ssd" "autodefrag" "discard=async" ];
    };

  # swap partition for swapfile
  fileSystems."/swap" =
    { device = "/dev/disk/by-uuid/7fa08817-7609-421b-a3ff-9e0d1c4eb1da";
      fsType = "btrfs";
      options = [ "subvol=swap" "noatime" ];
    };

  # efi 
  fileSystems."/boot/efi" =
    { device = "/dev/disk/by-uuid/9BF3-4C4D";
      fsType = "vfat";
    };

  # swapfile
  swapDevices = [ { device = "/swap/swapfile"; } ];
}
