local mainMod = "SUPER"
local scriptDir = "~/.config/hypr/scripts/"

hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + W", hl.dsp.window.close())
hl.bind("ALT + F4", hl.dsp.window.close())
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd(scriptDir .. "logout_menu.sh"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("thunar"))
hl.bind(
	mainMod .. " + V",
	-- hl.dsp.exec_cmd("cliphist list | fuzzel --dmenu --mesg=Clipboard | cliphist decode | wl-copy")
	-- hl.dsp.exec_cmd(scriptDir .. "fuzzel-cliphist-image.sh")
	hl.dsp.exec_cmd("walker -m clipboard")
)
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("SUDO_ASKPASS=" .. scriptDir .. "askpass-fuzzel walker "))
hl.bind(
	mainMod .. " + D",
	hl.dsp.exec_cmd("SUDO_ASKPASS=" .. scriptDir .. "askpass-fuzzel walker -m runner --maxheight 200")
)
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo("toggle")) --- pseudo window keeps its floating size when tiled
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + TAB", hl.dsp.exec_cmd("walker -m windows"))
hl.bind(mainMod .. " + SHIFT + SPACE", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.window.pin({ action = "toggle" }))
hl.bind(mainMod .. " + CTRL + SPACE", function()
	local w = hl.get_active_window()
	local focus = "floating"
	if w ~= nil and w.floating then
		focus = "tiled"
	end
	hl.dispatch(hl.dsp.focus({ window = focus }))
end)
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("hyprpicker -anf hex -s 2.5"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd(scriptDir .. "screenshot.sh --select"))
hl.bind("PRINT", hl.dsp.exec_cmd(scriptDir .. "screenshot.sh --full"))
hl.bind("ALT + TAB", hl.dsp.window.cycle_next())
hl.bind("ALT + SHIFT + TAB", hl.dsp.window.cycle_next())
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen("fullscreen", "toggle"))
hl.bind("F11", hl.dsp.window.fullscreen("fullscreen", "toggle"))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(scriptDir .. "switch_lang.sh"))

hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("walker -m bluetooth"))
hl.bind(mainMod .. " + SHIFT + A", hl.dsp.exec_cmd("pavucontrol"))
hl.bind(mainMod .. " + CTRL + SHIFT + A", hl.dsp.exec_cmd("walker -m wireplumber"))
hl.bind("CTRL + SHIFT + ALT + XF86Launch7", hl.dsp.pass({ window = "class:^(discord)$" }))
hl.bind("CTRL + SHIFT + ALT + XF86Launch8", hl.dsp.pass({ window = "class:^(discord)$" }))
hl.bind("CTRL + SHIFT + ALT + XF86Launch9", hl.dsp.exec_cmd(scriptDir .. "volume.sh --toggle-mic"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 10%-"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set +10%"))
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(scriptDir .. "volume.sh --inc"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(scriptDir .. "volume.sh --dec"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))

hl.bind(mainMod .. " + G", hl.dsp.group.toggle())
hl.bind(mainMod .. " + SHIFT + G", hl.dsp.group.lock_active())
hl.bind(mainMod .. " + semicolon", hl.dsp.window.move({ out_of_group = true }))
hl.bind(mainMod .. " + bracketleft", hl.dsp.group.next())
hl.bind(mainMod .. " + bracketright", hl.dsp.group.prev())

-- Move window (Move window within group)
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "l", group_aware = true }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "d", group_aware = true }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "u", group_aware = true }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "r", group_aware = true }))

-- Move workspace
hl.bind(mainMod .. " + CTRL + SHIFT + left", hl.dsp.workspace.move({ monitor = "l" }))
hl.bind(mainMod .. " + CTRL + SHIFT + down", hl.dsp.workspace.move({ monitor = "d" }))
hl.bind(mainMod .. " + CTRL + SHIFT + up", hl.dsp.workspace.move({ monitor = "u" }))
hl.bind(mainMod .. " + CTRL + SHIFT + right", hl.dsp.workspace.move({ monitor = "r" }))

-- Move focus
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "l" }), { submap_universal = true })
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "r" }), { submap_universal = true })
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "u" }), { submap_universal = true })
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "d" }), { submap_universal = true })
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "l" }), { submap_universal = true })
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "d" }), { submap_universal = true })
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "u" }), { submap_universal = true })
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "r" }), { submap_universal = true })

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
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + bracketleft", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
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
	local resizeStep = 25
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
