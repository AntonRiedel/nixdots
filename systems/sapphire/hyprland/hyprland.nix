{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    settings = {
      monitor = [
        "eDP-1,preferred,auto,2,transform,0"
      ];

      plugin.touch_gestures = {
        sensitivity = 4;
        workspace_swipe_fingers = 3;
      };
      # exec-once = [
      #   "iio-hyprland"
      # ];
    };
    plugins = [
      pkgs.hyprlandPlugins.hyprgrass
      # optional integration with pulse-audio, see examples/hyprgrass-pulse/README.md
      # inputs.hyprgrass.packages.${pkgs.system}.hyprgrass-pulse
    ];

  };

  xdg.configFile."waybar/config".source = ./waybar/config;
  xdg.configFile."waybar/style.css".source = ./waybar/style.css;
  xdg.configFile."kanshi/config".source = ./kanshi/config;
}
