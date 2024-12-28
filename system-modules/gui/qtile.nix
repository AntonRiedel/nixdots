{ pkgs, ... }:
{
  services.xserver.enable = false;
  services.xserver.xkb.layout = "eu";

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

  # enable ydotool
  programs.ydotool = {
    group = "input";
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    wayland-utils
    xwayland
    kanshi
    wl-clipboard
    gnome-keyring
    eduvpn-client
    wdisplays
    # lightlocker
    # flameshot
    # xorg.xset
  ];
}
