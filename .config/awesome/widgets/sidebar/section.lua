local beautiful = require('beautiful')
local wibox = require('wibox')

local utils = require('utils')

local section = function (args)
	local section = wibox.widget({
		right	= _G.dpi(20),
		left	= _G.dpi(20),
		top		= _G.dpi(10),
		widget	= wibox.container.margin,
	})

	local title = args.title and wibox.widget({
		{
			markup	= utils.colorize_text(args.title, beautiful.sidebar_title_fg),
			align	= beautiful.sidebar_position,
			widget	= wibox.widget.textbox,
			font	= beautiful.sidebar_title_font,
		},
		top		= _G.dpi(8),
		left	= _G.dpi(8),
		right	= _G.dpi(8),
		widget	= wibox.container.margin,
	}) or nil

	section:setup({
		{
			title,
			args.widget,
			layout	= wibox.layout.fixed.vertical,
		},
		bg		= beautiful.sidebar_section_bg,
		shape	= utils.rrect(_G.dpi(5)),
		widget	= wibox.container.background,
	})

	return section
end

return section
