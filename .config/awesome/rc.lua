local awful = require('awful')
local beautiful = require("beautiful")
local xrdb = beautiful.xresources.get_current_theme()
local naughty = require("naughty")
local ruled = require("ruled")

_G.dpi = beautiful.xresources.apply_dpi

_G.x = {
	background = xrdb.background,
	foreground = xrdb.foreground,
	color0     = xrdb.color0,
	color1     = xrdb.color1,
	color2     = xrdb.color2,
	color3     = xrdb.color3,
	color4     = xrdb.color4,
	color5     = xrdb.color5,
	color6     = xrdb.color6,
	color7     = xrdb.color7,
	color8     = xrdb.color8,
	color9     = xrdb.color9,
	color10    = xrdb.color10,
	color11    = xrdb.color11,
	color12    = xrdb.color12,
	color13    = xrdb.color13,
	color14    = xrdb.color14,
	color15    = xrdb.color15,
}

_G.screen_width = awful.screen.focused().geometry.width
_G.screen_height = awful.screen.focused().geometry.height

require("awful.autofocus")

-- Load Theme
local theme_dir = os.getenv('HOME') .. '/.config/awesome/theme/'
beautiful.init(theme_dir .. 'theme.lua')

-- Error Handling
naughty.connect_signal("request::display_error", function(message, startup)
	naughty.notification({
		urgency = "critical",
		title   = "Oops, an error happened"..(startup and " during startup!" or "!"),
		message = message
	})
end)

-- Keybindings & Mousebindings
require('keys')

-- Declarative object management


modkey = "Mod4"
-- }}}


require('layout')

ruled.client.connect_signal("request::rules", function ()
	-- All clients will match this rule.
	ruled.client.append_rule {
		id         = "global",
		rule       = { },
		properties = {
			focus     = awful.client.focus.filter,
			raise     = true,
			screen    = awful.screen.preferred,
			placement = awful.placement.no_overlap+awful.placement.no_offscreen
		}
	}

	-- Floating clients.
	ruled.client.append_rule {
		id       = "floating",
		rule_any = {
			instance = { "copyq", "pinentry" },
			class    = {
				"Arandr", "Blueman-manager", "Gpick", "Kruler", "Sxiv",
				"Tor Browser", "Wpa_gui", "veromix", "xtightvncviewer"
			},
			-- Note that the name property shown in xprop might be set slightly after creation of the client
			-- and the name shown there might not match defined rules here.
			name    = {
				"Event Tester",  -- xev.
			},
			role    = {
				"AlarmWindow",    -- Thunderbird's calendar.
				"ConfigManager",  -- Thunderbird's about:config.
				"pop-up",         -- e.g. Google Chrome's (detached) Developer Tools.
			}
		},
		properties = { floating = true }
	}

	-- Add titlebars to normal clients and dialogs
	ruled.client.append_rule {
		id         = "titlebars",
		rule_any   = { type = { "normal", "dialog" } },
		properties = { titlebars_enabled = true      }
	}

	-- Set Firefox to always map on the tag named "2" on screen 1.
	-- ruled.client.append_rule {
		--     rule       = { class = "Firefox"     },
		--     properties = { screen = 1, tag = "2" }
		-- }
	end)

	-- }}}

	ruled.notification.connect_signal('request::rules', function ()
		-- All notifications will match this rule.
		ruled.notification.append_rule {
			rule       = { },
			properties = {
				screen           = awful.screen.preferred,
				implicit_timeout = 5,
			}
		}
	end)

	naughty.connect_signal("request::display", function(n)
		naughty.layout.box { notification = n }
	end)

	-- }}}

	-- Enable sloppy focus, so that focus follows mouse.
	client.connect_signal("mouse::enter", function(c)
		c:activate { context = "mouse_enter", raise = false }
	end)
