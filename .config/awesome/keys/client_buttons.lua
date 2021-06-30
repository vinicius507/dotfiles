local awful = require('awful')
local gears = require('gears')

local client_buttons = gears.table.join(
	awful.button({}, 1,
		function (c)
			client.focus = c
		end
	),
	awful.button({ _G.superkey }, 1, awful.mouse.client.move),
	awful.button({ _G.superkey }, 3,
		function (c)
			client.focus = c
			awful.mouse.client.resize(c)
		end
	)
)

return client_buttons
