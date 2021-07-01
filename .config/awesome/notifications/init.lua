local beautiful = require('beautiful')
local naughty = require('naughty')

local notifications = {}

-- Notification settings
naughty.config.defaults['icon_size'] = beautiful.notification_icon_size

naughty.config.defaults['border_width'] = beautiful.notification_border_width

-- Timeouts
naughty.config.defaults.timeout = 5
naughty.config.presets.low.timeout = 2
naughty.config.presets.critical.timeout = 12

--- Notifiy
-- Create or update notification automagically. Requires storing the
-- notification in a variable.

notifications.notify = function (args, notif)
	local n = notif

	if n and not n._private.is_destroyed and not n.is_expired then
		notif.title = args.title or notif.title
		notif.message = args.message or notif.message
		notif.icon = args.icon or notif.icon
		notif.timeout = args.timeout or notif.timeout
	else
		n = naughty.notification(args)
	end
	return n
end

notifications.init = function ()
	-- Daemons
	require('notifications.volume')

	-- Load Theme
	require('theme.notifications')
end

-- TODO: handle notification icon

return notifications
