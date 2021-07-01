local wibox = require('wibox')

local mytextclock = wibox.widget({
	format = '%R',
	widget = wibox.widget.textclock,
})

return mytextclock
