local awful = require('awful')
local wibox = require("wibox")
local beautiful = require('beautiful')

local tagnames		= beautiful.tagnames or { '1', '2', '3', '4' }
local taglist		= require('widgets.panel.taglist')
local textclock		= require('widgets.panel.textclock')
local systray		= require('widgets.panel.systray')

local set_panel = function (s)
	-- Each screen has its own tag table.
	awful.tag(tagnames, s, awful.layout.layouts[1])

	s.panel	= awful.wibar({
		screen = s,
		position = beautiful.wibar_position,
		width = beautiful.wibar_width,
		height = beautiful.wibar_height,
	})

	s.taglist		= taglist(s)
	s.systray		= systray

	s.start_widgets = wibox.widget({
		s.taglist,
		layout	= wibox.layout.fixed.horizontal,
	})

	s.middle_widgets = wibox.widget({
		textclock,
		layout	= wibox.layout.fixed.horizontal,
	})


	s.end_widgets = wibox.widget({
		s.systray,
		layout	= wibox.layout.fixed.horizontal,
	})

	s.panel:setup({
		s.start_widgets,
		s.middle_widgets,
		s.end_widgets,
		expand = 'none',
        layout = wibox.layout.align.horizontal,
	})

end

return set_panel
