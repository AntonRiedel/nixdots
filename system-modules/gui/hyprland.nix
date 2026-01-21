{ pkgs, ... }:
{
  programs.hyprland = {
    enable = true;
    systemd.setPath.enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  services.hypridle.enable = true;
  programs.hyprlock.enable = true;
  programs.uwsm.enable = true;

  programs.regreet = {
    enable = true;
    settings = {
      background = {
        path = "/home/anton/nextcloud/wallpaper/wallpaper.png";
        fit = "fill";
      };
    };
  };

  # security.pam.services.greetd.kwallet.enable = true;

  # fonts
  fonts.packages = with pkgs; [
    fira-code
    fira-code-symbols
    font-awesome
  ];

  # for wayland
  programs.ydotool = {
    group = "input";
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    wayland
    wayland-protocols
    hyprland-protocols
    wayland-utils
    iio-sensor-proxy
    iio-hyprland
    adwaita-icon-theme
    snixembed
    xwayland
    dunst
    kanshi
    wl-clipboard
    waybar
    libsForQt5.qt5.qtwayland
    kdePackages.qtwayland
    hyprpaper
    nwg-displays
    copyq
    xdg-desktop-portal-gtk
    grim
    slurp
    swappy
  ];
}
