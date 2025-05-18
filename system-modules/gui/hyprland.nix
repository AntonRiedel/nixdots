{ pkgs, ... }:
{
  programs.hyprland = {
    enable = true;
    # package = pkgs-unstable.hyprland;
    systemd.setPath.enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  services.hypridle.enable = true;
  programs.hyprlock.enable = true;
  programs.uwsm.enable = true;
  # services.displayManager.sddm = {
  #   enable = true;
  #   wayland.enable = true;
  # };
  programs.regreet.enable = true;

  # fonts
  fonts.packages = with pkgs; [
    fira-code
    fira-code-symbols
  ];

  # for wayland
  programs.ydotool = {
    group = "input";
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    wayland
    wlr-randr
    wayland-protocols
    wayland-utils
    xwayland
    kanshi
    wl-clipboard
    waybar
    hyprpaper
    hyprshot
    xdg-desktop-portal
    displaylink
  ];
}
