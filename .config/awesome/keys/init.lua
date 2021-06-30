local kbd = require('awful').keyboard
local mau5 = require('awful').mouse

-- Globals
_G.superkey = 'Mod4'
_G.altkey = 'Mod1'
_G.ctrlkey = 'Control'
_G.shiftkey = 'Shift'

-- Keybindings
local global_keys = require('keys.global_keys')
local client_keys = require('keys.client_keys')

kbd.append_global_keybinding(global_keys)
client.connect_signal('request::default_keybindings',
	function ()
		kbd.append_client_keybindings(client_keys)
	end
)

-- Mousebindings
local desktop_buttons = require('keys.desktop_buttons')
local client_buttons = require('keys.client_buttons')

mau5.append_global_mousebindings(desktop_buttons)

client.connect_signal('request::default_mousebindings',
	function ()
		mau5.append_client_mousebindings(client_buttons)
	end
)
