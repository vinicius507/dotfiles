local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')
local taglist_buttons = require('keys.taglist_buttons')


local mytaglist = function (s)
	local taglist = awful.widget.taglist({
		screen = s,
		filter  = awful.widget.taglist.filter.all,
		buttons = taglist_buttons,
		widget_template = {
			{
				{
					{
						{
							{
								{
									id     = 'text_role',
									widget = wibox.widget.textbox,
								},
								layout = wibox.layout.fixed.horizontal,
							},
							left  = _G.dpi(8),
							right = _G.dpi(8),
							widget = wibox.container.margin
						},
						bg = beautiful.wibar_bg,
						widget = wibox.container.background,
					},
					bottom = _G.dpi(2),
					widget = wibox.container.margin,
				},
				id     = 'background_role',
				widget = wibox.container.background,
			},
			widget = wibox.container.margin,
		},
	})

	return taglist
end

return mytaglist
