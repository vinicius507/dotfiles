local awful = require('awful')
local gears = require('gears')
local beautiful = require('beautiful')
local wibox = require('wibox')

local utils = require('utils')

-- Widgets
local profile		= require('widgets.sidebar.profile')
local clock			= require('widgets.sidebar.clock')
local hardware		= require('widgets.sidebar.hardware')
local playerctl		= require('widgets.sidebar.playerctl')

-- Sidebar
local sidebar = wibox({ visible = false, ontop = true, type = 'dock', screen = mouse.screen })
sidebar.fg = beautiful.sidebar_fg or beautiful.wibar_fg or '#FFFFFF'
sidebar.bg = '#00000000'
sidebar.opacity = beautiful.sidebar_opacity or 1
sidebar.height = screen.primary.geometry.height * 0.6
sidebar.width = beautiful.sidebar_width or _G.dpi(300)
local radius = beautiful.sidebar_border_radius or _G.dpi(3)

local placement, sidebar_shape
if beautiful.sidebar_position == 'right' then
	placement = (awful.placement.right)
	sidebar_shape = utils.prrect(radius, true, false, false, true)
else
	placement = (awful.placement.left)
	sidebar_shape = utils.prrect(radius, false, true, true, false)
end

placement(sidebar)

sidebar:buttons(gears.table.join(
	awful.button({}, 3,
		function ()
			_G.hide_sidebar()
		end
	)
))

sidebar:setup({
	{
		{
			profile,
			clock,
			playerctl,
			hardware,
			layout	= wibox.layout.fixed.vertical,
		},
		widget	= wibox.container.margin,
		top		= _G.dpi(20),
		bottom	= _G.dpi(20),
	},
	bg		= beautiful.sidebar_bg,
	widget	= wibox.container.background,
	shape	= sidebar_shape
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
