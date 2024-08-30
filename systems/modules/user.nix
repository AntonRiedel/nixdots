{ pkgs, lib, ... }:
{
  # user account
  users.users.anton = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "adbusers" "libvirtd" "input" ];
    shell = pkgs.zsh;
  };
}
