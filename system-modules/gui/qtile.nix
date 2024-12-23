{ pkgs, ... }:
{
  # services.xserver.enable = true;
  # services.xserver.xkb.layout = "eu";
  # services.xserver.displayManager.lightdm.enable = true;

  # setup display manager which supports wayland
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
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
    wayland-utils
    xwayland
    kanshi
    wl-clipboard
    # lightlocker
    # flameshot
    # xorg.xset
  ];
}
