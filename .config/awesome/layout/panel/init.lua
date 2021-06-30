local awful = require('awful')
local wibox = require("wibox")
local beautiful = require('beautiful')

local tagnames = beautiful.tagnames or { '1', '2', '3', '4', '5' }

local mytaglist = require('layout.panel.mytaglist')
local mywibox = require('layout.panel.mywibox')
local mytextclock = require('layout.panel.mytextclock')

local set_panel = function (s)
	-- Each screen has its own tag table.
	awful.tag(tagnames, s, awful.layout.layouts[1])

	s.mytaglist = mytaglist(s)

	s.mywibox = mywibox(s)

	s.mywibox:setup({
        s.mytaglist,
		mytextclock,
		expand = 'outside',
        layout = wibox.layout.align.horizontal,
	})

end

return set_panel
