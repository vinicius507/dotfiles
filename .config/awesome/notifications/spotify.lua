local notifications = require('notifications')

local notif

awesome.connect_signal('spotify::song',
	function (song, artist)
		-- Send notification
		local message = song .. ' - ' .. artist
		notif = notifications.notify({
			title = 'Now Playing',
			message = message,
			app_name = 'spotify',
			urgency = 'low'
		}, notif)
	end
)
