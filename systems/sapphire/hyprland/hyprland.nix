{ ... }:
{
  wayland.windowManager.hyprland.settings.monitor = [
    # "HDMI-A-2,1920x1080@60,0x0,1"
  ];
  # xdg.configFile."hypr/hyprpaper.conf".source = ./hypr/hyprpaper.conf;
  xdg.configFile."waybar/config".source = ./waybar/config;
  xdg.configFile."waybar/style.css".source = ./waybar/style.css;
  xdg.configFile."kanshi/config".source = ./kanshi/config;
}
