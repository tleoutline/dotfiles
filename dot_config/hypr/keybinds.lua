local mainMod = "SUPER"

hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + W", hl.dsp.window.kill("active"))
hl.bind("ALT + F4", hl.dsp.window.kill("active"))
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd("~/.config/hypr/scripts/logout_menu.sh"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("thunar"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("cliphist list | fuzzel --dmenu | cliphist decode | wl-copy"))
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("SUDO_ASKPASS=~/.config/hypr/scripts/askpass-fuzzel fuzzel"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("SUDO_ASKPASS=~/.config/hypr/scripts/askpass-fuzzel fuzzel --dmenu | zsh"))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo("toggle")) --- pseudo window keeps its floating size when tiled
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + TAB", hl.dsp.exec_cmd("rofi -show window"))
hl.bind(mainMod .. " + SHIFT + SPACE", hl.dsp.window.float("toggle"))
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("hyprpicker -anf hex -s 2.5"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("~/.config/hypr/scripts/screenshot.sh --select"))
hl.bind("PRINT", hl.dsp.exec_cmd("~/.config/hypr/scripts/screenshot.sh"))
hl.bind("ALT + TAB", hl.dsp.window.cycle_next())
hl.bind("ALT + SHIFT + TAB", hl.dsp.window.cycle_next())
hl.bind("F11", hl.dsp.window.fullscreen("fullscreen", "toggle"))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("~/.config/hypr/scripts/switch_lang.sh"))

hl.bind(mainMod .. " + SHIFT + A", hl.dsp.exec_cmd("pavuctrl"))
hl.bind("Control_L + Shift_L + Alt_L + XF86Launch9", hl.dsp.exec_cmd("~/.config/hypr/scripts/volume.sh --toggle-mic"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 10%-"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set +10%"))
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("~/.config/hypr/scripts/volume.sh --inc"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("~/.config/hypr/scripts/volume.sh --dec"),
	{ locked = true, repeating = true }
)
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))

hl.bind(mainMod .. " + G", hl.dsp.group.toggle())
hl.bind(mainMod .. " + SHIFT + G", hl.dsp.group.lock_active())
hl.bind(mainMod .. " + semicolon", hl.dsp.window.move({ out_of_group = true }))
hl.bind(mainMod .. " + bracketleft", hl.dsp.group.next())
hl.bind(mainMod .. " + bracketright", hl.dsp.group.prev())

-- Mode window (Move window within group)
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "l", group_aware = true }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "d", group_aware = true }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "u", group_aware = true }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "r", group_aware = true }))
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "l", group_aware = true }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "d", group_aware = true }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "u", group_aware = true }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "r", group_aware = true }))

-- Move focus
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "d" }))
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "d" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "r" }))

-- Switch workspaces
for i = 0, 9 do
	local key = tostring(i)
	local workspace = tostring(i == 0 and 10 or i)
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = workspace }))
end

-- Move active window to a workspace
for i = 0, 9 do
	local key = tostring(i)
	local workspace = tostring(i == 0 and 10 or i)
	hl.bind(
		mainMod .. " + SHIFT + " .. key,
		hl.dsp.window.move({
			workspace = workspace,
			follow = true,
		})
	)
end
hl.bind(mainMod .. " + SHIFT + bracketright", hl.dsp.window.move({ workspace = "r+1" }))
hl.bind(mainMod .. " + SHIFT + bracketleft", hl.dsp.window.move({ workspace = "r-1" }))

-- Scroll through workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + bracketleft", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + bracketright", hl.dsp.focus({ workspace = "e+1" }))

-- Mouse bindings
-- left click drag to move
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
-- right click drag to resize
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
-- shift right click drag to resize and keep aspect ratio
hl.bind(
	mainMod .. " + SHIFT + mouse:273",
	hl.dsp.window.resize({
		keep_aspect_ratio = true,
	}),
	{ mouse = true }
)

hl.bind(mainMod .. " + R", hl.dsp.submap("resize"))

hl.define_submap("resize", function()
	local resizeStep = 10
	-- Set repeating binds for resizing the active window.
	hl.bind("right", hl.dsp.window.resize({ x = resizeStep, y = 0, relative = true }), { repeating = true })
	hl.bind("L", hl.dsp.window.resize({ x = resizeStep, y = 0, relative = true }), { repeating = true })
	hl.bind("left", hl.dsp.window.resize({ x = -resizeStep, y = 0, relative = true }), { repeating = true })
	hl.bind("H", hl.dsp.window.resize({ x = -resizeStep, y = 0, relative = true }), { repeating = true })
	hl.bind("up", hl.dsp.window.resize({ x = 0, y = resizeStep, relative = true }), { repeating = true })
	hl.bind("K", hl.dsp.window.resize({ x = 0, y = resizeStep, relative = true }), { repeating = true })
	hl.bind("down", hl.dsp.window.resize({ x = 0, y = -resizeStep, relative = true }), { repeating = true })
	hl.bind("J", hl.dsp.window.resize({ x = 0, y = -resizeStep, relative = true }), { repeating = true })

	-- Use `reset` to go back to the global submap
	hl.bind("escape", hl.dsp.submap("reset"))
	hl.bind(mainMod .. " + R", hl.dsp.submap("reset"))
end)
