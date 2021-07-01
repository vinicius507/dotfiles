local notifications = require('notifications')

local notif
local first_time = true

awesome.connect_signal('spotify::song',
	function (song, artist)
		-- Send notification
		if first_time then
			first_time = false
		else
			local message = song .. ' - ' .. artist
			notif = notifications.notify({
				title = 'Now Playing',
				message = message,
				app_name = 'spotify',
				urgency = 'low'
			}, notif)
		end
	end
)
