{ ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;

    settings = {
      monitor = [
        "eDP-1,1920x1080@60,0x0,1"
        "HDMI-A-1,1920x1080@60,auto-left,1"
        "DVI-I-1,1920x1080@60,0x0,1"
        "DVI-I-2,1920x1080@60,auto-right,1"
      ];

      xwayland.force_zero_scaling = true;

      env = [
        "GDK_SCALE,2"
        "XCURSOR_SIZE,32"
        "ELECTRON_OZONE_PLATFORM_HINT,auto"
      ];

      exec-once = [
        "kanshi &"
        "hyprpaper &"
        "waybar &"
        "dunst &"
        "keepassxc &"
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
        enabled = true;

        bezier = [
          "myBezier, 0.05, 0.9, 0.1, 1.05"
        ];

        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
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
        "$mainMod, W, exec, brave --password-store=basic"
        "$mainMod SHIFT, W, exec, firefox"
        "$mainMod, E, exec, pcmanfm"
        "$mainMod, G, exec, keepmenu -C"
        "$mainMod Control_L, L, exec, hyprlock"
        "$mainMod, PRINT, exec, hyprshot -m window"
        ", PRINT, exec, hyprshot -m output"
        "$mainMod SHIFT, PRINT, exec, hyprshot -m region"
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

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      "$mainMod" = "SUPER";
    };
  };

  xdg.configFile."hypr/hypridle.conf".source = ./hypridle.conf;
  xdg.configFile."hypr/hyprpaper.conf".source = ./hyprpaper.conf;
  xdg.configFile."hypr/hyprlock.conf".source = ./hyprlock.conf;

}
