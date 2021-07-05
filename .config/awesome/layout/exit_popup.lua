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
	_G.exit_popup_hide()
	awful.spawn.with_shell('systemctl suspend')
end

local exit_command = function ()
	awesome.quit()
end

local lock_command = function ()
	require('naughty').notify({ title = 'Command not found', message = 'Lock command missing', app_name = 'err' })
	_G.exit_popup_hide()
end

local base_button = require('widgets.exit-popup.button')

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
			_G.exit_popup_hide()
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

-- Keygrabber
local keys = {
	Escape	= function () _G.exit_popup_hide() end,
	e		= function () exit_command() end,
	l		= function () lock_command() end,
	p		= function () poweroff_command() end,
	q		= function () _G.exit_popup_hide() end,
	r		= function () reboot_command() end,
	s		= function () suspend_command() end,
}

local parse = function (_, stop_key, _, _)
	if keys[stop_key] then
		keys[stop_key]()
	end
end

local keygrabber = awful.keygrabber({
	stop_callback		= parse,
	stop_key			= {
		'Escape', 'e', 'l',
		'p', 'q', 'r', 's',
	},
	mask_modkeys		= true,
})

-- Popup functions

_G.exit_popup_show = function ()
	keygrabber:start()
	popup.visible = true
end

_G.exit_popup_hide = function ()
	keygrabber:stop()
	popup.visible = false
end
