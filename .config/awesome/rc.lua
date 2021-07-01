local awful = require('awful')
local beautiful = require('beautiful')
local xrdb = beautiful.xresources.get_current_theme()
local naughty = require('naughty')

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

require('awful.autofocus')

-- Load Theme
local theme_dir = os.getenv('HOME') .. '/.config/awesome/theme/'
beautiful.init(theme_dir .. 'theme.lua')

-- Error Handling
naughty.connect_signal('request::display_error', function(message, startup)
	naughty.notification({
		urgency = 'critical',
		title   = 'Oops, an error happened'..(startup and ' during startup!' or '!'),
		message = message
	})
end)

-- Daemons
require('daemons')

-- Keybindings & Mousebindings
require('keys')

-- Layout
require('layout')

-- Rules
require('config.rules')

-- Notifications
require('notifications').init()
