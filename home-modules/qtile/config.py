from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.backend.wayland import InputConfig
import subprocess, os

mod = "mod4"

terminal = "ghostty"
# terminal = "kitty"
browser = "brave --password-store=basic"
browser2 = "firefox"
browser3 = "qutebrowser"
pwdPicker = "keepmenu -C"
vncviewer = "vncviewer"
dmenu = "rofi -show run"
wallpaper = "/home/anton/nextcloud/wallpaper/nixos.png"
screenshot = "flameshot gui"
# screenshot = "grim -g $(slurp) - | swappy -f -"


keys = [
    Key([mod], "j", lazy.layout.next()),
    Key([mod], "k", lazy.layout.previous()),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
    Key([mod], "h", lazy.layout.shrink()),
    Key([mod], "l", lazy.layout.grow()),
    Key([mod], "Tab", lazy.next_layout()),
    Key([mod, "shift"], "c", lazy.window.kill()),
    Key([mod, "control"], "r", lazy.reload_config()),
    Key([mod, "control"], "q", lazy.shutdown()),
    # Key([mod], "r", lazy.spawncmd()),
    Key([mod], "r", lazy.spawn(dmenu)),
    Key([mod], "space", lazy.window.toggle_floating()),
    Key([mod, "shift"], "space", lazy.spawn(screenshot)),
    Key([mod], "f", lazy.window.toggle_fullscreen()),
    Key([mod], "period", lazy.next_screen()),
    Key([mod], "comma", lazy.prev_screen()),
    Key([mod], "Return", lazy.spawn(terminal)),
    Key([mod], "g", lazy.spawn(pwdPicker)),
    Key([mod], "w", lazy.spawn(browser)),
    Key([mod, "shift"], "w", lazy.spawn(browser2)),
    Key([mod, "control"], "w", lazy.spawn(browser3)),
    Key([mod], "v", lazy.spawn(vncviewer)),
    Key([mod], "p", lazy.spawn("pulsemixer --change-volume +10")),
    Key([mod, "shift"], "p", lazy.spawn("pulsemixer --change-volume -10")),
    Key([mod], "m", lazy.spawn("pulsemixer --toggle-mute")),
    # Key([mod, "shift"], "l", lazy.spawn("light-locker-command -l")),
]

groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key([mod], i.name, lazy.group[i.name].toscreen()),
            Key([mod, "shift"], i.name, lazy.window.togroup(i.name)),
        ]
    )

layouts = [
    layout.MonadTall(ratio=0.55, single_border_width=0, new_client_position="top"),
    layout.Max(),
]

widget_defaults = dict(
    font="mono",
    fontsize=14,
    padding=4,
)
extension_defaults = widget_defaults.copy()


def getMonitors():
    output = subprocess.check_output(["xrandr", "-q"]).decode("utf-8")
    monitors = []
    for line in output.splitlines():
        if "connected" in line:
            monitor = line.split()[0]
            monitors.append(monitor)
    return monitors


screens = []
Flag = True
for _ in getMonitors():
    MyWidgets = [
        widget.CurrentScreen(),
        widget.CurrentLayoutIcon(),
        widget.GroupBox(),
        # widget.Sep(),
        # widget.Prompt(),
        widget.Sep(),
        widget.WindowName(),
        # widget.TextBox(fmt="NET"),
        # widget.NetGraph(frequency=5),
        # widget.Sep(),
        # widget.TextBox(fmt="CPU"),
        # widget.CPUGraph(frequency=5),
        widget.Sep(),
        widget.TextBox(
            fmt="🔊",
        ),
        widget.PulseVolume(),
        widget.Sep(),
        widget.TextBox(
            fmt="🧠",
        ),
        widget.Memory(
            measure_mem="G",
        ),
        widget.Sep(),
        widget.TextBox(
            fmt="🔋",
        ),
        widget.Battery(
            format="{char}{percent:2.0%} {hour:d}:{min:02d}",
        ),
        widget.Sep(),
        widget.Clock(
            format="%H:%M (%a) %d.%m.%Y",
        ),
    ]
    if Flag:
        MyWidgets.extend(
            [
                # widget.Systray(),
                widget.StatusNotifier(),
            ]
        )
        Flag = False
    screens.append(
        Screen(top=bar.Bar(MyWidgets, 24), wallpaper=wallpaper, wallpaper_mode="fill")
    )


@lazy.function
def window_to_previous_screen(qtile, switch_group=False):
    i = qtile.screens.index(qtile.current_screen)
    if i != 0:
        group = qtile.screens[i - 1].group.name
        qtile.current_window.togroup(group, switch_group)


@lazy.function
def window_to_next_screen(qtile, switch_group=False):
    i = qtile.screens.index(qtile.current_screen)
    if i + 1 != len(qtile.screens):
        group = qtile.screens[i + 1].group.name
        qtile.current_window.togroup(group, switch_group)


keys.extend(
    [
        Key([mod, "shift"], "comma", window_to_next_screen(switch_group=False)),
        Key([mod, "shift"], "period", window_to_previous_screen(switch_group=False)),
        # Key([mod,"control"],"comma",window_to_next_screen(switch_group=True)),
        # Key([mod,"control"],"period",window_to_previous_screen(switch_group=True)),
    ]
)

# Drag floating layouts.
mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = {
    # "type:keyboard": InputConfig(kb_layout="eu")
    "type:keyboard": InputConfig(kb_layout="eu", kb_repeat_rate=60)
    # "type:keyboard": InputConfig(kb_layout="eu", kb_repeat_rate=50, kb_repeat_delay=600)
}


@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser("~/.config/qtile/autostart.sh")
    subprocess.run(home)


# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
