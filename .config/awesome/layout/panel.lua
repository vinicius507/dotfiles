local awful = require('awful')
local wibox = require("wibox")
local beautiful = require('beautiful')

local tagnames		= beautiful.tagnames or { '1', '2', '3', '4' }
local taglist		= require('widgets.panel.taglist')
local textclock		= require('widgets.panel.textclock')
local taglayout		= require('widgets.panel.taglayout')

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
	s.taglayout	= taglayout(s)

	s.panel:setup({
        s.taglist,
		textclock,
		s.taglayout,
		expand = 'none',
        layout = wibox.layout.align.horizontal,
	})

end

return set_panel
