{ config, pkgs, lib, ... }:
{
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      swtpm.enable = true;
      ovmf = {
        enable = true;
	packages = [ pkgs.OVMFFull.fd ];
      };
    };
  };

  virtualisation.podman = {
  enable = true;
  dockerCompat = true;
  };

  environment.systemPackages = with pkgs; [
    virt-manager
    virtiofsd
    distrobox
  ];
}
