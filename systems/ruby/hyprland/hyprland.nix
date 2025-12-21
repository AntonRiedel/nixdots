{ ... }:
{
  # wayland.windowManager.hyprland.settings.monitor = [
  #   "eDP-1,1920x1080@60,0x0,1"
  #   "HDMI-A-1,preferred,auto,2,mirror,eDP-1"
  #   "DP-2,preferred,auto,2,mirror,eDP-1"
  #   "DP-1,preferred,auto,2,mirror,eDP-1"
  #   "DVI-I-1,1920x1080@60,0x0,1"
  #   "DVI-I-2,1920x1080@60,auto-right,1"
  # ];

  wayland.windowManager.hyprland.extraConfig = ''
    source = ~/.config/hypr/monitors.conf
  '';

  xdg.configFile."waybar/config".source = ./waybar/config;
  xdg.configFile."waybar/style.css".source = ./waybar/style.css;
  # xdg.configFile."kanshi/config".source = ./kanshi/config;
}
