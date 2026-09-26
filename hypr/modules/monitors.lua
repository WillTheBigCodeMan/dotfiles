-- Monitor settings

hl.monitor({
	output = "eDP-1",
	mode = "2256x1504@60",
	position = "0x0",
	scale = 1.3333333,
})

hl.monitor({
	output = "DP-1",
	mode = "1920x1080@144",
	position = "-2256x0",
	scale = 1,
})

hl.monitor({
	output = "",
	mode = "prefered",
	position = "auto",
	scale = 1,
	mirror = "eDP-1",
})
