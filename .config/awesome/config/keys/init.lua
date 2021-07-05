local kbd = require('awful').keyboard

local global_keys = require('config.keys.global_keys')
local client_keys = require('config.keys.client_keys')

kbd.append_global_keybinding(global_keys)
client.connect_signal('request::default_keybindings',
	function ()
		kbd.append_client_keybindings(client_keys)
	end
)

