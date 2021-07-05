local beautiful = require('beautiful')
local wibox = require('wibox')
local naughty = require('naughty')

local actions = function (n)
	wibox.widget({
		notification = n,
		base_layout = wibox.widget({
			spacing = _G.dpi(3),
			layout = wibox.layout.flex.horizontal,
		}),
		widget_template = {
			{
				{
					{
						id = 'text_role',
						font = beautiful.notification_font,
						widget = wibox.widget.textbox
					},
					left = _G.dpi(6),
					right = _G.dpi(6),
					widget = wibox.container.margin
				},
				widget = wibox.container.place
			},
			bg = _G.x.color0..'32',
			forced_height = _G.dpi(25),
			forced_width = _G.dpi(70),
			widget = wibox.container.background
		},
		style = {
			underline_normal = false,
			underline_selected = true,
		},
		widget = naughty.list.actions
	})
end

return actions
