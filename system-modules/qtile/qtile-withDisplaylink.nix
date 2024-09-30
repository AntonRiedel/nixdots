{ pkgs, ... }:
{
  services.xserver.enable = true;
  services.xserver.xkb.layout = "eu";
  services.xserver.videoDrivers = [ "amdgpu" "displaylink" "modesetting" ];
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.windowManager.qtile = {
    enable = true;
    extraPackages = python3Packages: with python3Packages; [ qtile-extras ];
  };
  services.libinput.enable = true;

  # fonts
  fonts.packages = with pkgs; [
    fira-code
    fira-code-symbols
  ];

  environment.systemPackages = with pkgs; [
    lightlocker
    flameshot
    xorg.xset
  ];
}
