local awful = require('awful')

local set_layouts = function ()
    awful.layout.append_default_layouts({
        awful.layout.suit.spiral.dwindle,
        awful.layout.suit.floating,
        awful.layout.suit.max,
    })
end

return set_layouts
