local rotate_waypaper = function()
	hl.dispatch(hl.dsp.exec_cmd("waypaper --random"))
	hl.dispatch(hl.dsp.exec_cmd("pkill -USR2 hyprlock"))
end

local waypaper_timer = hl.timer(rotate_waypaper, { timeout = 60000, type = "repeat" })
waypaper_timer:set_enabled(false)

hl.on("hyprland.start", function()
	hl.exec_cmd("waybar")
	hl.exec_cmd("hypridle")
	-- hl.exec_cmd("awww-daemon")
	-- rotate_waypaper()

	hl.exec_cmd("elephant")
	hl.exec_cmd("walker --gapplication-service")

	os.execute("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	os.execute("sleep 0.1")
	os.execute("systemctl --user start hyprland-session.target")
end)

hl.on("hyprland.shutdown", function()
	os.execute("systemctl --user stop hyprland-session.target && sleep 0.1")
end)
