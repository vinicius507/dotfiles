local wibox = require('wibox')

local mytextclock = wibox.widget({
	format	= '%R',
	align	= 'center',
	font	= 'M+ 1m regular 10',
	widget	= wibox.widget.textclock,
})

return mytextclock
