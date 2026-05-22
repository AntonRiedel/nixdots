-- hyprland.lua
-- Clean master layout, no decorations, noctalia-shell

--------------------
---- MONITORS ----
--------------------

-- adjust output name to match your setup (check `hyprctl monitors`)
hl.monitor({
	output = "*",
	mode = "preferred",
	position = "auto",
	scale = "auto",
})

---------------------
---- MY PROGRAMS ----
---------------------

local terminal = "ghostty"
local fileManager = "pcmanfm"
local menu = "rofi -show run"
local browser = "firefox"
local screenshot = 'grim -g "$(slurp)" - | swappy -f -'

-------------------
---- AUTOSTART ----
-------------------

-- hl.exec_once("noctalia-shell")
-- hl.exec_once("wl-paste --type text --watch cliphist store")
-- hl.exec_once("wl-paste --type image --watch cliphist store")
-- hl.exec_once("swaybg -i $HOME/nextcloud/wallpaper/arch10.jpg -m fill")
-- hl.exec_once("kanshi")
-- hl.exec_once("nm-applet")

hl.on("hyprland.start", function()
	hl.exec_cmd("noctalia-shell")
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")
	hl.exec_cmd("swaybg -i $HOME/nextcloud/wallpaper/arch10.jpg -m fill")
	hl.exec_cmd("kanshi")
	hl.exec_cmd("nm-applet")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("NIXOS_OZONE_WL", "1")

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
	general = {
		gaps_in = 0,
		gaps_out = 0,

		border_size = 3,
		col = {
			active_border = "rgba(ff4444ff)", -- bright red, change to taste
			inactive_border = "rgba(444444aa)",
		},

		resize_on_border = true,
		allow_tearing = false,
		layout = "master",
	},

	decoration = {
		rounding = 0,
		active_opacity = 1.0,
		inactive_opacity = 1.0,
		shadow = { enabled = false },
		blur = { enabled = false },
	},

	animations = {
		enabled = false,
	},

	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
		enable_swallow = true,
		swallow_regex = "^(kitty|com.mitchellh.ghostty)$",
	},
})

-- Master layout
hl.config({
	master = {
		new_status = "master",
		mfact = 0.55, -- master area ratio
		new_on_top = true,
	},
})

---------------
---- INPUT ----
---------------

hl.config({
	input = {
		kb_layout = "eu,us",
		repeat_rate = 40,
		repeat_delay = 200,
		follow_mouse = 1,
		sensitivity = 0,
		touchpad = {
			natural_scroll = false,
		},
	},
})

---------------------
---- KEYBINDINGS ----
---------------------

local mod = "SUPER"

-- Applications
hl.bind(mod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mod .. " + W", hl.dsp.exec_cmd(browser))
hl.bind(mod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mod .. " + Print", hl.dsp.exec_cmd(screenshot))

-- Window management
hl.bind(mod .. " + SHIFT + C", hl.dsp.window.close())
hl.bind(mod .. " + Tab", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mod .. " + Space", hl.dsp.window.float({ action = "toggle" }))

-- Focus (vim keys)
hl.bind(mod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Move windows (vim keys)
hl.bind(mod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(mod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))

-- Monitor focus
hl.bind(mod .. " + Comma", hl.dsp.focus({ monitor = "l" }))
hl.bind(mod .. " + Period", hl.dsp.focus({ monitor = "r" }))
hl.bind(mod .. " + SHIFT + Comma", hl.dsp.window.move({ monitor = "l" }))
hl.bind(mod .. " + SHIFT + Period", hl.dsp.window.move({ monitor = "r" }))

hl.bind(mod .. " + SHIFT + S", hl.dsp.workspace.swap_monitors({ monitor1 = "0", monitor2 = "+1" }))

-- Workspaces
for i = 1, 9 do
	hl.bind(mod .. " + " .. i, hl.dsp.focus({ workspace = i }))
	hl.bind(mod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end

-- Scroll through workspaces
hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Mouse binds
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Media keys
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Quit
hl.bind(mod .. " + CTRL + Q", hl.dsp.exit())

---------------------
---- WINDOW RULES ----
---------------------

hl.window_rule({
	name = "suppress-maximize",
	match = { class = ".*" },
	suppress_event = "maximize",
})

hl.window_rule({
	name = "fix-xwayland-drags",
	match = { class = "^$", title = "^$", xwayland = true, float = true, fullscreen = false, pin = false },
	no_focus = true,
})
