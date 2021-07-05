local mau5 = require('awful').mouse

local desktop_buttons = require('config.buttons.desktop_buttons')
local client_buttons = require('config.buttons.client_buttons')

mau5.append_global_mousebindings(desktop_buttons)

client.connect_signal('request::default_mousebindings',
	function ()
		mau5.append_client_mousebindings(client_buttons)
	end
)
