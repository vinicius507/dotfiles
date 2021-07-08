local config = {}

local beautiful = require('beautiful')

config.user = require('config.user')
config.apps = require('config.apps')

config.setup = function ()
	require('awful.autofocus')
	require('config.globals')

	-- Load Theme
	local theme_dir = os.getenv('HOME') .. '/.config/awesome/theme/'
	beautiful.init(theme_dir .. 'theme.lua')

	-- Keys
	require('config.keys')

	-- Buttons
	require('config.buttons')

	-- Rules
	require('config.rules')

	-- Daemons
	require('daemons')

	-- Layout
	require('layout')

	-- Notifications
	require('config.notifications').init()

end

return config
