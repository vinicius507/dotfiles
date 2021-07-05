local naughty = require('naughty')

-- Error Handling
naughty.connect_signal('request::display_error', function(message, startup)
	naughty.notification({
		urgency = 'critical',
		app_name = 'err',
		title   = 'Oops, an error happened'..(startup and ' during startup!' or '!'),
		message = message
	})
end)

-- Config
require('config').setup()

-- Daemons
require('daemons')

-- Layout
require('layout')
