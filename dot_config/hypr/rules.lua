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
		title = "Picture in picture",
	},
	float = true,
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
	name = "steam-friend-list",
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
	no_blur = true,
})

hl.workspace_rule({ workspace = "2", layout = "master" })
