local notifications = require('notifications')

local notif
local first_time = true

awesome.connect_signal('daemon::volume',
	function (percentage, muted)
		if first_time then
			first_time = false
		else
			-- Send notification
			local message
			if muted then
				message = 'muted'
			else
				message = tostring(percentage)
			end

			notif = notifications.notify({
				title = 'Volume',
				message = message,
				app_name = 'volume',
				urgency = 'low'
			}, notif)
		end
	end
)
