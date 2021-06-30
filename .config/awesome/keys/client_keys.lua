local awful = require('awful')
local gears = require('gears')
local utils = require('utils')

local client_keys = gears.table.join(
	-- Move by direction
	awful.key({ _G.superkey, _G.shiftkey }, 'h',
		function (c)
			utils.move_client(c, 'left')
		end
	),
	awful.key({ _G.superkey, _G.shiftkey }, 'j',
		function (c)
			utils.move_client(c, 'down')
		end
	),
	awful.key({ _G.superkey, _G.shiftkey }, 'k',
		function (c)
			utils.move_client(c, 'up')
		end
	),
	awful.key({ _G.superkey, _G.shiftkey }, 'l',
		function (c)
			utils.move_client(c, 'right')
		end
	),

	-- Single Tap: Center Client
	-- Double Tap: Center Client + Floating + Resize
	awful.key({ _G.superkey }, 'c',
		function (c)
			awful.placement.centered(c, {
				honor_default = true,
				honor_padding = true
			})
			utils.single_double_tap(
				nil,
				function ()
					utils.float_and_resize(c, _G.screen_width * 0.6, _G.screen_height * 0.6)
				end
			)
		end
	),
    awful.key({ _G.superkey, _G.shiftkey, _G.ctrlkey }, 'j', function (c)
        c:relative_move(0,  _G.dpi(20), 0, 0)
    end),
    awful.key({ _G.superkey, _G.shiftkey, _G.ctrlkey }, 'k', function (c)
        c:relative_move(0, _G.dpi(-20), 0, 0)
    end),
    awful.key({ _G.superkey, _G.shiftkey, _G.ctrlkey }, 'h', function (c)
        c:relative_move(_G.dpi(-20), 0, 0, 0)
    end),
    awful.key({ _G.superkey, _G.shiftkey, _G.ctrlkey }, 'l', function (c)
        c:relative_move(_G.dpi( 20), 0, 0, 0)
    end),

	-- Toggle Fullscreen
	awful.key({ _G.superkey }, 'f',
		function(c)
			c.fullscreen = not c.fullscreen
			c:raise()
		end,
		{ description = 'toggle fullscreen', group = 'client' }
	),

	-- Close Client
	awful.key({ _G.superkey, _G.shiftkey }, 'q',
		function(c)
			c:kill()
		end,
		{ description = 'close', group = 'client' }
	),

	-- Toggle Floating
	awful.key({ _G.superkey, _G.ctrlkey }, 'space',
		function(c)
			local layout_is_floating = (awful.layout.get(mouse.screen) == awful.layout.suit.floating)
			if not layout_is_floating then
				c.floating = not c.floating
			end
		end
	),

	-- Promote to master
	awful.key({ _G.superkey, _G.ctrlkey }, 'Return',
		function(c)
			c:swap(awful.c.getmaster())
		end,
		{description = 'promote to master', group = 'client' }
	),

	-- Set sticky
	awful.key({ _G.superkey, _G.shiftkey }, 'p',
		function(c)
			c.sticky = not c.sticky
		end,
		{ description = 'toggle sticky', group = 'client'}
	),

	-- Minimize
	awful.key({ _G.superkey }, 'n',
		function(c)
			c.minimized = true
		end,
		{ description = 'minimize', group = 'client' }
	),

	-- Maximize
	awful.key({ _G.superkey }, 'm',
		function(c)
			c.maximized = true
		end,
		{ description = 'maximize', group = 'client' }
	)
)

return client_keys
