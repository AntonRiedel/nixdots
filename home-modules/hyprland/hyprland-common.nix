{ config, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;

    settings = {

      xwayland.force_zero_scaling = true;

      env = [
        "GDK_SCALE,2"
        "XCURSOR_SIZE,16"
        "ELECTRON_OZONE_PLATFORM_HINT,auto"
      ];

      exec-once = [
        "kanshi"
        "waybar"
        "dunst"
        "hyprpaper"
        "keepassxc"
        "copyq --start-server"
      ];

      input = {
        kb_layout = "eu";
        repeat_rate = 60;
        repeat_delay = 300;
        follow_mouse = 1;
        sensitivity = 0;

        touchpad.natural_scroll = false;
      };

      general = {
        gaps_in = 1;
        gaps_out = 1;
        border_size = 1;
        # col.active_border = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        # col.inactive_border = "rgba(595959aa)";
        layout = "master";
        allow_tearing = false;
      };

      decoration = {
        rounding = 5;

        blur = {
          enabled = true;
          size = 3;
          passes = 1;
        };

        shadow.enabled = true;
      };

      animations = {
        enabled = false;
      };

      master = {
        new_status = "master";
        mfact = 0.55;
      };

      gestures.workspace_swipe = "off";

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        enable_swallow = true;
        swallow_regex = "^(kitty|com\.mitchellh\.ghostty)$";
      };

      # Keybinds
      bind = [
        "$mainMod SHIFT, C, killactive,"
        "$mainMod SHIFT, Q, exit,"
        "$mainMod, R, exec, rofi -show run"
        "$mainMod, return, exec, ghostty"
        "$mainMod, W, exec, firefox"
        "$mainMod SHIFT, W, exec, brave"
        "$mainMod, E, exec, pcmanfm"
        "$mainMod, G, exec, keepmenu -C"
        "$mainMod Control_L, L, exec, hyprlock"
        "$mainMod, PRINT, exec, hyprshot -m region --clipboard-only"
        # ", PRINT, exec, hyprshot -m output"
        # "$mainMod SHIFT, PRINT, exec, hyprshot -m region"
        "$mainMod SHIFT, return, layoutmsg, swapwithmaster"
        "$mainMod, space, togglefloating,"
        "$mainMod, tab, fullscreen,"
        "$mainMod, j, layoutmsg, cyclenext"
        "$mainMod, k, layoutmsg, cycleprev"
        "$mainMod SHIFT, j, layoutmsg, swapnext"
        "$mainMod SHIFT, k, layoutmsg, swapprev"
        "$mainMod, h, layoutmsg, mfact -0.1"
        "$mainMod, l, layoutmsg, mfact +0.1"
        "$mainMod, comma, focusmonitor, -1"
        "$mainMod, period, focusmonitor, +1"
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
      ];

      binde = [
        ", XF86AudioRaiseVolume, exec, pulsemixer --change-volume +5"
        ", XF86AudioLowerVolume, exec, pulsemixer --change-volume -5"
        ", XF86AudioMute, exec, pulsemixer --toggle-mute"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      "$mainMod" = "SUPER";
    };
  };

  xdg.configFile."hypr/hypridle.conf".source = ./hypr/hypridle.conf;
  xdg.configFile."hypr/hyprlock.conf".source = ./hypr/hyprlock.conf;
  xdg.configFile."hypr/hyprpaper.conf".source = ./hypr/hyprpaper.conf;
  xdg.configFile."rofi/config.rasi".source = ./rofi/config.rasi;

}
