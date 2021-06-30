local wibox = require('wibox')

local mytextclock = wibox.widget({
	format = '%B %d, %Y - %R',
	widget = wibox.widget.textclock,
})

return mytextclock
