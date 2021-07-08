local wibox = require('wibox')
local gears = require('gears')
local beautiful = require('beautiful')
local naughty = require('naughty')

local utils = require('utils')

--- For antialiasing
beautiful.notification_bg = '#00000000'

local default_icon = {
	low			= '',
	normal		= '',
	critical	= '',
}

local app_config = {
	discord		= { icon = 'ﭮ', title = true },
	err			= { icon = '', title = true },
	Firefox		= { icon = '', title = true },
	screenshot	= { icon = '', title = false },
	Spotify		= { icon = '阮', title = true },
	player		= { icon = '', title = true },
	volume		= { icon = '墳', title = true },
	wpg			= { icon = '', title = false },
	layout		= { icon = '', title = true },
}


local urgency_color = {
	low 		= _G.x.color5,
	normal		= _G.x.color4,
	critical	= _G.x.color9,
}

-- Template
naughty.connect_signal('request::display',
	function (n)
		local icon_widget = require('widgets.notifications.icon')

		local icon, title_visible
		local color = urgency_color[n.urgency]

		if app_config[n.app_name] then
			icon = app_config[n.app_name].icon
			title_visible = app_config[n.app_name].title
		else
			icon = default_icon[n.urgency]
			title_visible = true
		end

		local actions = require('widgets.notifications.actions')(n)

		naughty.layout.box({
			notification = n,
			type = 'notification',
			shape = gears.shape.rectangle,
			border_width = beautiful.notification_border_width,
			border_color = beautiful.notification_border_color,
			position = beautiful.notification_position,
			widget_template = {
				{
					{
						{
							{
								{
									markup = utils.colorize_text(icon, color),
									align = 'center',
									valign = 'center',
									widget = icon_widget,
								},
								forced_width = _G.dpi(50),
								bg = _G.x.background,
								widget  = wibox.container.background,
							},
							{
								{
									{
										align = 'left',
										visible = title_visible,
										font = beautiful.notification_font,
										markup = '<b>'..n.title..'</b>',
										widget = wibox.widget.textbox,
									},
									{
										align = 'left',
										widget = naughty.widget.message,
									},
									{
										utils.vertical_pad(dpi(10)),
										{
											actions,
											shape = utils.rrect(dpi(4)),
											widget = wibox.container.background,
										},
										visible = n.actions and #n.actions > 0,
										layout  = wibox.layout.fixed.vertical
									},
									layout  = wibox.layout.align.vertical,
								},
								margins = beautiful.notification_margin,
								widget  = wibox.container.margin,
							},
							layout  = wibox.layout.fixed.horizontal,
						},
						strategy	= 'min',
						width		= beautiful.notification_max_width or _G.dpi(270),
						widget		= wibox.container.constraint,
					},
					strategy	= 'max',
					width		= beautiful.notification_max_width or _G.dpi(270),
					height   	= beautiful.notification_max_height or _G.dpi(150),
					widget		= wibox.container.constraint,
				},
				shape = utils.rrect(beautiful.notification_border_radius),
				bg = _G.x.color8,
				widget = wibox.container.background,
			}
		})
	end
)
