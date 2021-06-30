local gears = require('gears')
local beautiful = require('beautiful')

local set_wallpaper = function(s)
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        gears.wallpaper.maximized(wallpaper, s, false)
    end
end

return set_wallpaper
