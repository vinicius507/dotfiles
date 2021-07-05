local awful = require('awful')
local gears = require('gears')

local client_buttons = gears.table.join(
	-- Focus on click
	awful.button({}, 1,
		function (c)
			client.focus = c
		end
	),

	-- Move Client
	awful.button({ _G.superkey }, 1,
		function (c)
			c:activate { raise = true }
			awful.mouse.client.move(c)
		end
	),

	-- Resize Client
	awful.button({ _G.superkey }, 3,
		function (c)
			client.focus = c
			awful.mouse.client.resize(c)
		end
	)
)

return client_buttons
