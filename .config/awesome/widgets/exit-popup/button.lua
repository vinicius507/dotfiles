local awful = require('awful')
local gears = require('gears')
local beautiful = require('beautiful')
local wibox = require('wibox')

local utils = require('utils')

local icons = {
	poweroff	= '襤',
	reboot		= '勒',
	suspend		= '⏾',
	exit		= '',
	lock		= '',
}

local button = function (id, action)
	local icon_color	= beautiful['exit_popup_' .. id .. '_color']
	local icon			= icons[id]

	local b = wibox.widget({
		{
			{
				{
					markup	= utils.colorize_text(icon, icon_color),
					font	= beautiful.exit_popup_icon_font,
					widget	= wibox.widget.textbox,
					align = 'center',
				},
				forced_width = _G.dpi(47),
				bg = '#00000000',
				widget  = wibox.container.background,
			},
			layout = wibox.layout.align.horizontal,
			expand = 'none',
		},
		bg		= beautiful.exit_popup_button_bg_normal,
		shape	= utils.rrect(2),
		widget	= wibox.container.background,
	})

	local old_cursor, old_wibox
	b:connect_signal('mouse::enter',
		function(c)
			c:set_bg(beautiful.exit_popup_button_bg_focus)
			local wb = mouse.current_wibox
			old_cursor, old_wibox = wb.cursor, wb
			wb.cursor = 'hand2'
		end
	)

	b:connect_signal('mouse::leave',
		function (c)
			c:set_bg(beautiful.exit_popup_button_bg_normal)
			if old_wibox then
				old_wibox.cursor = old_cursor
				old_wibox = nil
			end
		end
	)

	b:buttons(gears.table.join(
		awful.button({}, 1,
			function ()
				action()
			end
		)
	))

	return b
end

return button
