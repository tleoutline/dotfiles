local _, c = pcall(require, "colours")
pcall(require, "autostart")
pcall(require, "keybinds")
pcall(require, "rules")

-- monitors
--- @diagnostic disable-next-line: missing-fields
hl.monitor({
	output = "DP-3",
	mode = "1980x1080@165",
	position = "auto",
	scale = "auto",
})
hl.monitor({
	output = "TAB-S7",
	mode = "2560x1600@120",
	position = "auto-left",
	scale = "2",
})
hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "auto",
})

-- env vars
hl.env("HYPRCURSOR_SIZE", 24)
hl.env("HYPRCURSOR_THEME", "Catppuccin Mocha Lavender")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

hl.config({
	input = {
		kb_layout = "us,th",
		follow_mouse = 1,
		touchpad = {
			natural_scroll = true,
			disable_while_typing = true,
			clickfinger_behavior = true,
		},
		sensitivity = 0, --- -1.0 - 1.0 => 0 = no modification
		numlock_by_default = true,
	},

	general = {
		gaps_in = 4,
		gaps_out = 8,
		border_size = 3,
		col = {
			active_border = {
				colors = {
					c.mauve_hex,
					c.blue_hex,
				},
				angle = 135,
			},
			inactive_border = c.surface0_hex,
		},
		layout = "scrolling",
	},

	group = {
		col = {
			border_active = {
				colors = { c.green_hex, c.blue_hex },
				angle = 45,
			},
			border_inactive = c.surface0_hex,
			border_locked_active = {
				colors = { c.red_hex, c.blue_hex },
				angle = 45,
			},
			border_locked_inactive = c.surface0_hex,
		},
	},

	decoration = {
		rounding = 10,
		blur = {
			enabled = true,
			xray = false,
			new_optimizations = true,
			size = 3,
			passes = 2,
		},
		dim_inactive = true,
		dim_strength = 0.1,
	},

	gestures = {
		--- in px, the distance of the touchpad gesture
		workspace_swipe_distance = 700,

		--- how much the swipe has to proceed in order to commence it.
		--- (0.7 -> if > 0.7 * distance, switch, if less, revert) [0.0 - 1.0]
		workspace_swipe_cancel_ratio = 0.2,

		--- minimum speed in px per timepoint to force the change ignoring
		--- `cancel_ratio`. Setting to 0 will disable this mechanic.
		workspace_swipe_min_speed_to_force = 5,
	},

	animations = {
		enabled = true,
	},

	layout = {},

	master = {
		mfact = 0.7, --- master window size factor
	},

	misc = {
		animate_manual_resizes = false,
	},

	xwayland = {
		force_zero_scaling = true,
	},
})

-- animations
hl.animation({
	leaf = "workspaces",
	enabled = true,
	speed = 5,
	bezier = "default",
})
hl.animation({
	leaf = "layers",
	enabled = true,
	speed = 3,
	bezier = "default",
	style = "popin",
})
