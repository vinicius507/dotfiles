local awful = require('awful')
local bling = require('bling')

local set_layouts = function ()
    awful.layout.append_default_layouts({
        awful.layout.suit.spiral.dwindle, -- Master Stack
		bling.layout.mstab, -- Master Stack Tab
        awful.layout.suit.max, -- Maximized
        awful.layout.suit.floating, -- Floating
    })
end

return set_layouts
