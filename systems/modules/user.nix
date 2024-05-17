{ pkgs, lib, ... }:
{
  # user account
  users.users.anton = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "adbusers" "libvirtd" ];
    shell = pkgs.zsh;
  };
}
