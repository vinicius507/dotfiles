local awful = require('awful')
local beautiful = require('beautiful')

local mywibox = function (s)
	return awful.wibar({
		screen = s,
		position = beautiful.wibar_position,
		width = beautiful.wibar_width,
		height = beautiful.wibar_height,
	})
end

return mywibox
