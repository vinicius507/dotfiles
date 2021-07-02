local awful = require('awful')
local gears = require('gears')
local beautiful = require('beautiful')
local wibox = require('wibox')

local utils = require('utils')

-- Commands
local poweroff_command = function ()
	awful.spawn.with_shell('poweroff')
end

local reboot_command = function ()
	awful.spawn.with_shell('reboot')
end

local suspend_command = function ()
	awful.spawn.with_shell('systemctl suspend')
end

local exit_command = function ()
	awesome.quit()
end

local lock_command = function ()
end

local icons = {
	poweroff	= '襤',
	reboot		= 'ﰇ',
	suspend		= '鈴',
	exit		= '',
	lock		= '',
}

local base_button = function (id, action)
	local icon_color	= beautiful['exit_popup_' .. id .. '_color']
	local icon			= icons[id]

	local button = wibox.widget({
		{
			{
				{
					{
						markup	= utils.colorize_text(icon, icon_color),
						font	= beautiful.exit_popup_icon_font,
						widget	= wibox.widget.textbox,
						align = 'center',
					},
					forced_width = _G.dpi(30),
					bg = '#00000000',
					widget  = wibox.container.background,
				},
				layout = wibox.layout.align.horizontal,
				expand = 'none',
			},
			widget = wibox.container.margin,
			left = _G.dpi(8),
			right = _G.dpi(8),
		},
		bg		= beautiful.exit_popup_button_bg_normal,
		shape	= utils.rrect(2),
		widget	= wibox.container.background,
	})

	local old_cursor, old_wibox

	button:connect_signal('mouse::enter',
		function(c)
			c:set_bg(beautiful.exit_popup_button_bg_focus)
			local wb = mouse.current_wibox
			old_cursor, old_wibox = wb.cursor, wb
			wb.cursor = 'hand2'
		end
	)

	button:connect_signal('mouse::leave',
		function (c)
			c:set_bg(beautiful.exit_popup_button_bg_normal)
			if old_wibox then
				old_wibox.cursor = old_cursor
				old_wibox = nil
			end
		end
	)

	button:buttons(gears.table.join(
		awful.button({}, 1,
			function ()
				action()
			end
		)
	))

	return button
end

local poweroff	= base_button('poweroff', poweroff_command)
local reboot 	= base_button('reboot', reboot_command)
local suspend	= base_button('suspend', suspend_command)
local exit		= base_button('exit', exit_command)
local lock		= base_button('lock', lock_command)

local popup		= wibox({ visible = false, ontop = true, type = 'toolbar', screen = mouse.screen })
popup.width		= _G.dpi(290)
popup.height	= _G.dpi(100)
awful.placement.centered(popup, { honor_workarea = true })

popup:buttons(gears.table.join(
	awful.button({}, 3,
		function ()
			popup.visible = false
		end
	)
))

popup:setup({
	{
		{
			{
				markup = utils.colorize_text('Power Menu', _G.x.color7),
				align = 'center',
				valign = 'center',
				widget = wibox.widget.textbox,
				font = 'M+ 1m regular 12',
			},
			top = _G.dpi(5),
			bottom = _G.dpi(5),
			widget = wibox.container.margin,
		},
		bg = _G.x.color8,
		widget = wibox.container.background,
	},
	{
		{
			poweroff,
			reboot,
			suspend,
			exit,
			lock,
			spacing = _G.dpi(5),
			spacing_widget = utils.vertical_pad,
			layout	= wibox.layout.flex.horizontal,
			widget	= wibox.container.margin,
		},
		widget = wibox.container.margin,
		left = _G.dpi(10),
		right = _G.dpi(10),
		top = _G.dpi(10),
		bottom = _G.dpi(10),
	},
	bg		= beautiful.exit_popup_bg,
	shape	= utils.rrect(_G.dpi(3)),
	widget  = wibox.container.background,
	layout	= wibox.layout.align.vertical,
})

_G.exit_popup_show = function ()
	popup.visible = true
end

_G.exit_popup_hide = function ()
	popup.visible = false
end
