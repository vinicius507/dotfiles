local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')

local clock = wibox.widget({
	widget	= wibox.container.margin,
	top		= _G.dpi(14),
	bottom	= _G.dpi(10),
})

clock:setup({
	{
		format	= '%H',
		font	= beautiful.sidebar_clock_font,
		widget	= awful.widget.textclock,
		align	= 'right',
		valign	= 'center',
	},
	{
		text	= '',
		widget	= wibox.widget.textbox,
	},
	{
		format	= '%M',
		font	= beautiful.sidebar_clock_font,
		widget	= awful.widget.textclock,
		align	= 'left',
		valign	= 'center',
		opacity	= 0.6,
	},
	expand = 'outside',
	layout = wibox.layout.align.horizontal,
})

return clock
