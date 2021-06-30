local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')

local titlebar_buttons = require('keys.titlebar_buttons')

return function(c)
	-- buttons for the titlebar
	awful.titlebar(c).widget = {
		{
			buttons = titlebar_buttons(c),
			widget = wibox.layout.fixed.horizontal(),
		},
		{
			font = beautiful.titlebar_font,
			buttons = titlebar_buttons(c),
			widget = awful.titlebar.widget.titlewidget(c),
		},
		{
			-- awful.titlebar.widget.maximizedbutton(c),
			-- awful.titlebar.widget.closebutton    (c),
			buttons = titlebar_buttons(c),
			layout = wibox.layout.fixed.horizontal()
		},
		layout = wibox.layout.align.horizontal,
		expand = 'outside'
	}
end
