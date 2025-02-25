{ pkgs, ... }:
{
  services.xserver.enable = true;
  services.xserver.xkb.layout = "eu";

  # setup display manager which supports wayland
  services.displayManager.sddm = {
    enable = true;
    # wayland.enable = true;
  };
  security.pam.services.sddm.enableKwallet = true;

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

  # for wayland
  # enable ydotool
  # programs.ydotool = {
  #   group = "input";
  #   enable = true;
  # };

  # environment.systemPackages = with pkgs; [
  # wayland-utils
  # xwayland
  # kanshi
  # wl-clipboard
  # wdisplays
  # ];
}
