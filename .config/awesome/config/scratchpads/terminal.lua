local bling = require('bling')
local beautiful = require('beautiful')

local user = require('config').user

local termpad = bling.module.scratchpad:new({
    command = user.floating_terminal .. ' --class termpad --title Scratchpad',
    rule = { instance = 'termpad' },
    sticky = false,
    autoclose = false,
    floating = true,
    geometry = {
		x		= beautiful.useless_gap * 2,
		y		= beautiful.useless_gap * 4 + _G.dpi(4),
		height	= _G.screen_height / 2,
		width	= _G.screen_width - (beautiful.useless_gap * 4),
	},
    reapply = true,
    dont_focus_before_close  = false,
})

return termpad
