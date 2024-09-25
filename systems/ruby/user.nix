{ pkgs, lib, ... }:
{
  users.users.anton = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "adbusers" "libvirtd" "input" ];
  };
}
