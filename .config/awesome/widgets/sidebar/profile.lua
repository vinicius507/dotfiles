local beautiful = require('beautiful')
local gears = require('gears')
local wibox = require('wibox')

local config = require('config')
local user = config.user
local utils = require('utils')

local profile = wibox.widget({ widget = wibox.container.margin })

profile:setup({
	{
		{
			halign		= 'center',
			image		= beautiful.profile_picture,
			widget		= wibox.widget.imagebox,
			clip_shape	= gears.shape.circle,
		},
		widget	= wibox.container.constraint,
		height	= _G.dpi(150),
		width	= _G.dpi(150),
		strategy	= 'max',
	},
	{
		text	= user.name,
		align	= 'center',
		widget	= wibox.widget.textbox,
		font	= beautiful.sidebar_profile_font,
	},
	spacing			= _G.dpi(-8),
	spacing_widget	= utils.vertical_pad,
	layout			= wibox.layout.fixed.vertical,
})

return profile
