local awful = require('awful')
local gears = require('gears')
local beautiful = require('beautiful')
local wibox = require('wibox')

local utils = {}

-- Switches to tag. If the tag is the one currently being shown, it'll go back
-- to the last tag.
utils.switch_tag = function(idx)
	local s = mouse.screen
	local tag = s.tags[idx]
	if tag then
		if tag == s.selected_tag then
			awful.tag.history.restore()
		else
			tag:view_only()
		end
	end
end

-- Move Floating window to edge 'direction'
local direction_translate = {
    ['up'] = 'top',
    ['down'] = 'bottom',
    ['left'] = 'left',
    ['right'] = 'right'
}
utils.move_to_edge = function(client, direction)
	local old = client:geometry()
	local new = awful.placement[direction_translate[direction]](client, {
		honor_padding = true,
		honor_workarea = true,
		margins = beautiful.useless_gap * 2,
		pretend = true
	})
	if direction == 'up' or direction == 'down' then
		client:geometry({ x = old.x, y = new.y })
	elseif direction == 'left' or direction == 'right' then
		client:geometry({ x = new.x, y = new.y })
	end
end

-- Move client to direction
-- If the layout/client is floating, it wil move the client to the edge
-- Swap by index if layout is maximized
-- Swap client by direction if tiled
utils.move_client = function(client, direction)
	if client.floating or (awful.layout.get(mouse.screen) == awful.layout.suit.floating) then
		utils.move_to_edge(client, direction)
	elseif awful.layout.get(mouse.screen) == awful.layout.suit.max then
		if direction == 'up' or direction == 'left' then
			awful.client.swap.byidx(-1, client)
		elseif direction == 'down' or direction == 'right' then
			awful.client.swap.byidx(1, client)
		end
	else
		awful.client.swap.bydirection(direction, client, nil)
	end
end

-- Single double tap
-- NOTE: TEST THIS SHIT
local double_tap_timer = nil
utils.single_double_tap = function (single_tap_function, double_tap_function)
	if double_tap_timer then
		double_tap_timer:stop()
		double_tap_timer = nil
		double_tap_function()
		return
	end
	double_tap_timer = gears.timer.start_new(0.20,
		function ()
			double_tap_timer = nil
			if single_tap_function then
				single_tap_function()
			end
			return false
		end
	)
end

-- Float and Resize
utils.float_and_resize = function (c, width, height)
    c.maximized = false
    c.width = width
    c.height = height
    awful.placement.centered(c,{honor_workarea=true, honor_padding = true})
    awful.client.property.set(c, 'floating_geometry', c:geometry())
    c.floating = true
    c:raise()
end

-- Colorize Text
utils.colorize_text = function (text, color)
	return "<span foreground='"..color.."'>"..text.."</span>"
end

-- Rounded Rectangle
utils.rrect = function(radius)
    return function(cr, width, height)
        gears.shape.rounded_rect(cr, width, height, radius)
    end
end

-- Vertical Pad
utils.vertical_pad = function (height)
    return wibox.widget({
        forced_height = height,
        layout = wibox.layout.fixed.vertical
    })
end

return utils
