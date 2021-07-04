local awful = require('awful')
local gears = require('gears')
local beautiful = require('beautiful')
local wibox = require('wibox')

local taglist_buttons = gears.table.join(
	awful.button({}, 1,
		function(t)
			t:view_only()
		end
	),
	awful.button({ _G.superkey }, 1,
	function(t)
			if client.focus then
				client.focus:move_to_tag(t)
			end
		end
	),
	awful.button({ }, 3, awful.tag.viewtoggle),
	awful.button({ _G.superkey }, 3,
		function(t)
			if client.focus then
				client.focus:toggle_tag(t)
			end
		end
	),
	awful.button({ }, 4,
		function(t)
			awful.tag.viewprev(t.screen)
		end
	),
	awful.button({ }, 5,
		function(t)
			awful.tag.viewnext(t.screen)
		end
	)
)

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
