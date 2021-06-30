local awful = require('awful')
local gears = require('gears')

local titlebar_buttons = function (c)
	return gears.table.join(
		awful.button({ }, 1, function ()
			c:activate { context = "titlebar", action = "mouse_move"  }
		end),
		awful.button({ }, 3, function ()
			c:activate { context = "titlebar", action = "mouse_resize"}
		end)
	)
end

return titlebar_buttons
