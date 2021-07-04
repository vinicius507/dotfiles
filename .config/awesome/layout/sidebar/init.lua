local awful = require('awful')
local gears = require('gears')
local beautiful = require('beautiful')
local wibox = require('wibox')

-- local config = require('config')
-- local user = config.user
-- local apps = config.apps
local utils	= require('utils')

-- Widgets
local section_base = function (args)
	local section = wibox.widget({
		right	= _G.dpi(20),
		left	= _G.dpi(20),
		top		= _G.dpi(10),
		widget	= wibox.container.margin,
	})

	local title = args.title and wibox.widget({
		{
			markup	= utils.colorize_text(args.title, beautiful.sidebar_title_fg),
			align	= beautiful.sidebar_position,
			widget	= wibox.widget.textbox,
			font	= beautiful.sidebar_title_font,
		},
		top		= _G.dpi(8),
		left	= _G.dpi(8),
		right	= _G.dpi(8),
		widget	= wibox.container.margin,
	}) or nil

	section:setup({
		{
			title,
			args.widget,
			layout	= wibox.layout.fixed.vertical,
		},
		bg		= beautiful.sidebar_section_bg,
		shape	= utils.rrect(_G.dpi(5)),
		widget	= wibox.container.background,
	})

	return section
end

local profile = require('layout.sidebar.profile')
local clock = require('layout.sidebar.clock')
local clock_section = section_base({ widget = clock })
local hardware = require('layout.sidebar.hardware')
local hardware_section = section_base({ title = 'Hardware',widget = hardware })

-- Sidebar
local sidebar = wibox({ visible = false, ontop = true, type = 'dock', screen = mouse.screen })
sidebar.fg = beautiful.sidebar_fg or beautiful.wibar_fg or '#FFFFFF'
sidebar.bg = '#00000000'
sidebar.opacity = beautiful.sidebar_opacity or 1
sidebar.height = screen.primary.geometry.height * 0.67
sidebar.width = beautiful.sidebar_width or _G.dpi(300)
local radius = beautiful.sidebar_border_radius or 0

local placement, shape
if beautiful.sidebar_position == 'right' then
	placement = (awful.placement.right)
	shape = utils.prrect(radius, true, false, false, true)
else
	placement = (awful.placement.left)
	shape = utils.prrect(radius, false, true, true, false)
end

placement(sidebar)

sidebar:setup({
	{
		profile,
		clock_section,
		hardware_section,
		layout	= wibox.layout.fixed.vertical,
	},
	shape	= shape,
	bg		= beautiful.sidebar_bg,
	widget	= wibox.container.background,
})

sidebar:connect_signal('mouse::leave',
	function ()
		_G.hide_sidebar()
	end
)

_G.hide_sidebar = function ()
	sidebar.visible = false
end

_G.show_sidebar = function ()
	sidebar.visible = true
end

-- Sidebar Activator
local sidebar_activator = wibox({ y = sidebar.y, width = 1, visible = true, ontop = false, opacity = 0, below = true, screen = mouse.screen })
sidebar_activator.height = sidebar.height
sidebar_activator:connect_signal('mouse::enter',
	function ()
		_G.show_sidebar()
	end
)

if beautiful.sidebar_position == 'right' then
	awful.placement.right(sidebar_activator)
else
	awful.placement.left(sidebar_activator)
end

sidebar_activator:buttons(
	gears.table.join(
		awful.button({ }, 4, function ()
			awful.tag.viewprev()
		end),
		awful.button({ }, 5, function ()
			awful.tag.viewnext()
		end)
))
