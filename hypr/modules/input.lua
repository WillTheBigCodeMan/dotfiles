-- Keyboard and mouse settings

hl.config({
	input = {
		kb_layout = "gb",
		follow_mouse = 1,
		sensitivity = -0.2,

		touchpad = {
			natural_scroll = true,
			scroll_factor = 0.6,
		},
	},
})

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
