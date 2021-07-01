local wibox = require('wibox')
local gears = require('gears')
local beautiful = require('beautiful')
local naughty = require('naughty')

local utils = require('utils')

--- For antialiasing
beautiful.notification_bg = '#00000000'

local default_icon = ''

local app_config = {
	discord		= { icon = 'ﭮ', title = true },
	err			= { icon = '', title = true },
	Firefox		= { icon = '', title = true },
	screenshot	= { icon = '', title = false },
	spotify		= { icon = '阮', title = true },
	volume		= { icon = '墳', title = true },
	wpg			= { icon = '', title = false },
}


local urgency_color = {
	low = _G.x.color5,
	normal = _G.x.color4,
	critical = _G.x.color9,
}

-- Template
naughty.connect_signal('request::display',
	function (n)
		local icon_widget = wibox.widget({
			font = 'FiraCode Nerd Font Mono 24',
			align = 'center',
			valign = 'center',
			widget = wibox.widget.textbox
		})

		local icon, title_visible
		local color = urgency_color[n.urgency]

		if app_config[n.app_name] then
			icon = app_config[n.app_name].icon
			title_visible = app_config[n.app_name].title
		else
			icon = default_icon
			title_visible = true
		end

		local actions = wibox.widget({
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
						left = dpi(6),
						right = dpi(6),
						widget = wibox.container.margin
					},
					widget = wibox.container.place
				},
				bg = x.color8..'32',
				forced_height = dpi(25),
				forced_width = dpi(70),
				widget = wibox.container.background
			},
			style = {
				underline_normal = false,
				underline_selected = true,
			},
			widget = naughty.list.actions
		})

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
								forced_width = dpi(50),
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
						width		= beautiful.notification_max_width or dpi(270),
						widget		= wibox.container.constraint,
					},
					strategy	= 'max',
					width		= beautiful.notification_max_width or dpi(270),
					height   	= beautiful.notification_max_height or dpi(150),
					widget		= wibox.container.constraint,
				},
				shape = utils.rrect(beautiful.notification_border_radius),
				bg = _G.x.color8,
				widget = wibox.container.background,
			}
		})
	end
)
