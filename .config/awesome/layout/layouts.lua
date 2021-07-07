local awful = require('awful')

local set_layouts = function ()
    awful.layout.append_default_layouts({
        awful.layout.suit.spiral.dwindle,
        awful.layout.suit.tile.right,
        awful.layout.suit.max,
        awful.layout.suit.floating,
    })
end

return set_layouts
