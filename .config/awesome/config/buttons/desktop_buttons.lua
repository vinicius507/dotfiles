local awful = require('awful')
local gears = require('gears')

local desktop_buttons = gears.table.join(
	-- Scroll to switch tags
	awful.button({}, 4, awful.tag.viewprev),
	awful.button({}, 5, awful.tag.viewnext)
)

return desktop_buttons
