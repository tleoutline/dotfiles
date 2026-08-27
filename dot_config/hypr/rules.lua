hl.window_rule({
	name = "xwayland-video-bridge-fixes",
	match = {
		class = "xwaylandvideobridge",
	},

	no_initial_focus = true,
	no_focus = true,
	no_anim = true,
	no_blur = true,
	max_size = { 1, 1 },
	opacity = 0.0,
})

hl.window_rule({
	name = "picture-in-picture",
	match = {
		title = [[[Pp]icture\W*in\W*[Pp]icture]],
	},
	float = true,
	pin = true,
	no_initial_focus = true,
})

hl.window_rule({
	name = "steam-friend-list",
	match = {
		class = "steam",
		title = "Friends List",
	},
	float = true,
})

hl.window_rule({
	name = "heartopia",
	match = {
		title = "Heartopia",
	},
	fullscreen = true,
})

hl.window_rule({
	name = "zen-browser",
	match = {
		class = "zen",
	},
	workspace = "2",
	-- no_blur = true,
})

-- hl.workspace_rule({ workspace = "2", layout = "master" })

hl.layer_rule({
	match = { namespace = "launcher" },
	animation = "popin",
	blur = true,
})

hl.layer_rule({
	match = { namespace = "hyprpicker" },
	no_anim = true,
	blur = false,
})

hl.layer_rule({
	match = { namespace = "notifications" },
	animation = "slide right",
})
