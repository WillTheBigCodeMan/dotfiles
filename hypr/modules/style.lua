-- General style settings

hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 10,
		col = { active_border = "rgba(00000000)", inactive_border = "rgba(00000000)" },
		resize_on_border = true,
		allow_tearing = false,
		layout = "dwindle",
		hover_icon_on_border = true,
	},

	decoration = {
		rounding = 10,
		active_opacity = 1,
		inactive_opacity = 0.9,

		shadow = {
			enabled = false,
		},

		blur = {
			enabled = true,
			size = 5,
			passes = 2,
			vibrancy = 0.1696,
		},
	},

	dwindle = {
		preserve_split = true,
	},
})
