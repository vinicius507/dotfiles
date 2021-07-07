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

local mx, my = _G.dpi(8), _G.dpi(8)
local t_layout = wibox.layout.align.vertical
if beautiful.titlebar_position == 'top' or beautiful.titlebar_position == 'bottom' then
	t_layout = wibox.layout.align.horizontal
	my = _G.dpi(0)
end


local titlebar = function (c)
	local t = awful.titlebar(c, {font = beautiful.titlebar_font, position = beautiful.titlebar_position, size = beautiful.titlebar_size})

	t:setup({
		{
			nil,
			{
				font	= beautiful.titlebar_font,
				align	= beautiful.titlebar_title_align or 'center',
				widget	= beautiful.titlebar_title_enabled and awful.titlebar.widget.titlewidget(c) or wibox.widget.textbox('')
			},
			layout	= t_layout
		},
		buttons	= titlebar_buttons(c),
		widget	= wibox.container.margin,
		left	= mx,
		right	= mx,
		top		= my,
		bottom	= my,
    })
end

return titlebar
