local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')

local utils = require('utils')

local l = beautiful.layout_icons

local mytaglayout = function (s)
	local t	= s.selected_tag
	local icon = l[awful.layout.getname(t.layout)] or 'blah'

	local layout = wibox.widget({ screen = s, layout = wibox.layout.fixed.horizontal })

	layout:setup({
		{
			id		= 'icon_role',
			markup	= utils.colorize_text(icon, beautiful.layout_icon_color),
			align	= 'center',
			widget	= wibox.widget.textbox,
			font	= beautiful.layout_icon_font,
		},
		widget			= wibox.container.background,
		forced_width	= _G.dpi(30),
	})

	t:connect_signal('property::layout',
		function (_)
			icon = l[awful.layout.getname(t.layout)] or 'blah'
			layout:get_children_by_id('icon_role')[1].markup = utils.colorize_text(icon, _G.x.color1)
		end
	)

	return layout
end

return mytaglayout
