MainMod = "SUPER"

-- Alt tab windows style program switching
hl.bind(
	MainMod .. " + ALT + TAB",
	hl.dsp.exec_cmd("hyprswitch gui --mod-key alt --key tab --close mode-key-release && hyprswitch dispatch")
)

-- Quick start programs

hl.bind(MainMod .. " + Q", hl.dsp.exec_cmd("kitty"))
hl.bind(MainMod .. " + N", hl.dsp.exec_cmd("swaync-client -t -sw"))
hl.bind(
	MainMod .. " + O",
	hl.dsp.exec_cmd("OBSIDIAN_USE_WAYLAND=1 obsidian -enable-features=UseOzonePlatform -ozone-platform=wayland")
)
hl.bind(MainMod .. " + R", hl.dsp.exec_cmd("pkill wofi; wofi --show drun"))
hl.bind(MainMod .. " + B", hl.dsp.exec_cmd("firefox"))
hl.bind(MainMod .. " + S", hl.dsp.exec_cmd('grim -f "$(slurp - d)"; pkill grim '))
hl.bind(MainMod .. " + U", hl.dsp.exec_cmd("kitty unicp.sh"))
hl.bind(MainMod .. " + E", hl.dsp.exec_cmd("~/Documents/HyprEmoji/target/release/hypremoji"))

-- Control keybinds
hl.bind(MainMod .. " + C", hl.dsp.window.close())
hl.bind(MainMod .. " + M", hl.dsp.exit())
hl.bind(MainMod .. " + V", hl.dsp.window.float())
hl.bind(MainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(MainMod .. " + J", hl.dsp.layout("togglesplit"))
hl.bind(MainMod .. " + F", hl.dsp.window.fullscreen())

-- Windows and workspaces

hl.bind(MainMod .. " + LEFT", hl.dsp.focus({ direction = "l" }))
hl.bind(MainMod .. " + RIGHT", hl.dsp.focus({ direction = "r" }))
hl.bind(MainMod .. " + UP", hl.dsp.focus({ direction = "u" }))
hl.bind(MainMod .. " + DOWN", hl.dsp.focus({ direction = "d" }))

hl.bind(MainMod .. " + ALT + LEFT", hl.dsp.window.move({ direction = "l" }))
hl.bind(MainMod .. " + ALT + RIGHT", hl.dsp.window.move({ direction = "r" }))
hl.bind(MainMod .. " + ALT + UP", hl.dsp.window.move({ direction = "u" }))
hl.bind(MainMod .. " + ALT + DOWN", hl.dsp.window.move({ direction = "d" }))

hl.bind(MainMod .. " + CTRL + LEFT", hl.dsp.window.swap({ direction = "l" }))
hl.bind(MainMod .. " + CTRL + RIGHT", hl.dsp.window.swap({ direction = "r" }))
hl.bind(MainMod .. " + CTRL + UP", hl.dsp.window.swap({ direction = "u" }))
hl.bind(MainMod .. " + CTRL + DOWN", hl.dsp.window.swap({ direction = "d" }))

hl.bind(MainMod .. " + SHIFT + LEFT", hl.dsp.window.move({ monitor = "l" }))
hl.bind(MainMod .. " + SHIFT + RIGHT", hl.dsp.window.move({ monitor = "r" }))
hl.bind(MainMod .. " + SHIFT + UP", hl.dsp.window.move({ monitor = "u" }))
hl.bind(MainMod .. " + SHIFT + DOWN", hl.dsp.window.move({ monitor = "d" }))

hl.bind(MainMod .. " + 1", hl.dsp.focus({ workspace = "1" }))
hl.bind(MainMod .. " + 2", hl.dsp.focus({ workspace = "2" }))
hl.bind(MainMod .. " + 3", hl.dsp.focus({ workspace = "3" }))
hl.bind(MainMod .. " + 4", hl.dsp.focus({ workspace = "4" }))
hl.bind(MainMod .. " + 5", hl.dsp.focus({ workspace = "5" }))
hl.bind(MainMod .. " + 6", hl.dsp.focus({ workspace = "6" }))
hl.bind(MainMod .. " + 7", hl.dsp.focus({ workspace = "7" }))
hl.bind(MainMod .. " + 8", hl.dsp.focus({ workspace = "8" }))
hl.bind(MainMod .. " + 9", hl.dsp.focus({ workspace = "9" }))

hl.bind(MainMod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = "1" }))
hl.bind(MainMod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = "2" }))
hl.bind(MainMod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = "3" }))
hl.bind(MainMod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = "4" }))
hl.bind(MainMod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = "5" }))
hl.bind(MainMod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = "6" }))
hl.bind(MainMod .. " + SHIFT + 7", hl.dsp.window.move({ workspace = "7" }))
hl.bind(MainMod .. " + SHIFT + 8", hl.dsp.window.move({ workspace = "8" }))
hl.bind(MainMod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = "9" }))

hl.bind(MainMod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(MainMod .. " + mouse:273", hl.dsp.window.resize())

-- Audio

hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+ && wpctl set-mute @DEFAULT_AUDIO_SINK@ 0"),
	{ repeating = true }
)

hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- && wpctl set-mute @DEFAULT_AUDIO_SINK@ 0"),
	{ repeating = true }
)

hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ 1"), { repeating = true, locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ 1"), { repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"), { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"), { repeating = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))

-- Lock on open lid

hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("hyprlock --immediate"))
