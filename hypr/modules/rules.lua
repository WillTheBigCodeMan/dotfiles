hl.window_rule({
	match = {
		class = ".*",
	},
	suppress_event = "maximize",
})

hl.window_rule({
	match = {
		class = "^$",
		title = "^$",
		focus = false,
		xwayland = true,
	},
	float = true,
	fullscreen_state = 0,
	pin = false,
})

hl.layer_rule({
	match = {
		namespace = ".*",
	},
	ignore_alpha = 0.5,
})

hl.layer_rule({
	match = {
		namespace = "(wofi)|(waybar)|(swaync)",
	},
	blur = true,
})
