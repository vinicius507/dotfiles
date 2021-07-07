local notifications = require('config.notifications')

local notif

awesome.connect_signal('bling::playerctl::title_artist_album',
	function (title, artist, _, player)
		notif = notifications.notify({
			title		= title,
			message		= artist,
			app_name	= player == 'mopidy' and 'Spotify' or 'player'
		}, notif)
	end
)
