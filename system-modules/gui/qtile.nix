{ pkgs, ... }:
{
  services.xserver.enable = true;
  services.xserver.xkb.layout = "eu";

  # setup display manager which supports wayland
  services.displayManager.sddm = {
    enable = true;
    # wayland.enable = true;
  };

  services.xserver.windowManager.qtile = {
    enable = true;
    extraPackages =
      python3Packages: with python3Packages; [
        qtile-extras
        pyxdg
      ];
  };
  services.libinput.enable = true;

  # fonts
  fonts.packages = with pkgs; [
    fira-code
    fira-code-symbols
  ];

  # for wayland
  # programs.ydotool = {
  #   group = "input";
  #   enable = true;
  # };

  # environment.systemPackages = with pkgs; [
  #   wayland
  #   wayland-protocols
  #   wayland-utils
  #   xwayland
  #   kanshi
  #   wl-clipboard
  #   wdisplays
  # ];
}
