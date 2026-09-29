require("modules.monitors")
require("modules.style")
require("modules.animations")
require("modules.input")
require("modules.keybinds")
require("modules.rules")

-- Global variables

Terminal = "kitty"
Menu = "wofi --show drun"

-- Programs to run on startup

hl.on("hyprland.start", function()
	hl.exec_cmd("kitty")
	hl.exec_cmd("waybar & swaync & swaybg -i ~/Pictures/1")
	hl.exec_cmd("systemctl --user start hyrppolkitagent & hypridle")
	hl.exec_cmd("hyrpswitch init --show-title --size-factore 5.5 --workspaces-per-row 5")
	hl.exec_cmd("syncthing")
	hl.exec_cmd("keepassxc")
end)

-- Environment variables

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
