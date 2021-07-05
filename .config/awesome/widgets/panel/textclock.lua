local wibox = require('wibox')

local mytextclock = wibox.widget({
	format	= '%R',
	align	= 'center',
	widget	= wibox.widget.textclock,
})

return mytextclock
