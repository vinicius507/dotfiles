local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')

local titlebar_buttons = require('keys.titlebar_buttons')

local titlebar = function (c)
	local t = awful.titlebar(c, {font = beautiful.titlebar_font, position = beautiful.titlebar_position, size = beautiful.titlebar_size})

	t:setup({
		nil,
        {
            buttons = titlebar_buttons(c),
            font = beautiful.titlebar_font,
            align = beautiful.titlebar_title_align or 'center',
            widget = beautiful.titlebar_title_enabled and awful.titlebar.widget.titlewidget(c) or wibox.widget.textbox("")
        },
        layout = wibox.layout.align.horizontal
    })
end

return titlebar
