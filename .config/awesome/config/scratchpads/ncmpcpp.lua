local bling = require('bling')

local user = require('config').user

local ncmpcpp = bling.module.scratchpad:new({
    command = user.player,
    rule = { instance = 'ncmpcpp' },
    sticky = false,
    autoclose = false,
    floating = true,
    geometry = {
		x		= _G.screen_width * 0.3,
		y		= _G.screen_height * 0.3,
		height	= _G.screen_height * 0.4,
		width	= _G.screen_width * 0.4,
	},
    reapply = true,
    dont_focus_before_close  = false,
})

return ncmpcpp
