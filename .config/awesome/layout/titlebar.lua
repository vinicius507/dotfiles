local awful = require('awful')
local gears = require('gears')
local beautiful = require('beautiful')
local wibox = require('wibox')

local titlebar_buttons = function (c)
	return gears.table.join(
		awful.button({ }, 1, function ()
			c:activate { context = "titlebar", action = "mouse_move", raise = true  }
		end),
		awful.button({ }, 3, function ()
			c:activate { context = "titlebar", action = "mouse_resize"}
		end)
	)
end

local titlebar = function (c)
	local t = awful.titlebar(c, {font = beautiful.titlebar_font, position = beautiful.titlebar_position, size = beautiful.titlebar_size})

	t:setup({
		{
			{
				{
					text	= '',
					widget	= wibox.widget.textbox,
				},
				forced_width	= _G.dpi(12),
				widget			= wibox.container.background,
			},
			{
				font	= beautiful.titlebar_font,
				align	= beautiful.titlebar_title_align or 'center',
				widget	= beautiful.titlebar_title_enabled and awful.titlebar.widget.titlewidget(c) or wibox.widget.textbox("")
			},
			layout = wibox.layout.align.horizontal
		},
		buttons	= titlebar_buttons(c),
		widget	= wibox.container.margin,
		left	= _G.dpi(8),
		right	= _G.dpi(8),
    })
end

return titlebar
