local awful = require('awful')
local beautiful = require('beautiful')
local xrdb = beautiful.xresources.get_current_theme()

-- DPI Function
_G.dpi = beautiful.xresources.apply_dpi

-- X Colors
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

-- Screen
_G.screen_width = awful.screen.focused().geometry.width
_G.screen_height = awful.screen.focused().geometry.height


-- Keys
_G.superkey = 'Mod4'
_G.altkey = 'Mod1'
_G.ctrlkey = 'Control'
_G.shiftkey = 'Shift'
