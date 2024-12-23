{ ... }:
{
  users.users.anton = {
    isNormalUser = true;
    description = "anton";
    extraGroups = [
      "wheel"
      "networkmanager"
      "libvirtd"
      "input"
      "adbusers"
    ];
  };
}
