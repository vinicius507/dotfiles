local awful = require('awful')
local gears = require('gears')
local beautiful = require('beautiful')
local wibox = require('wibox')

local section = require('widgets.sidebar.section')
local utils = require('utils')

local art = wibox.widget({
	forced_height	= _G.dpi(100),
	resize			= true,
	widget			= wibox.widget.imagebox,
})

local artbox = wibox.widget({
	{
		{
			-- HACK:
			text	= ' ',
			font	= 'FiraCode Nerd Font Regular 34',
			-- align	= 'center',
			valign	= 'center',
			widget	= wibox.widget.textbox,
		},
		forced_width	= _G.dpi(100),
		bg				= beautiful.bg_focus .. '66',
		fg				= beautiful.fg_focus,
		widget			= wibox.container.background,
	},
	art,
	layout = wibox.layout.stack,
})

local title_text = wibox.widget({
		markup = 'No Title',
		align = 'center',
		valign = 'center',
		ellipsize = 'middle',
		forced_height = dpi(12),
		widget = wibox.widget.textbox
})

local title_widget = wibox.widget({
	title_text,
	widget	= wibox.container.margin,
	top = _G.dpi(5),
	bottom = _G.dpi(2),
})

local artist_text = wibox.widget({
		markup = 'No Artist',
		align = 'center',
		valign = 'center',
		ellipsize = 'middle',
		forced_height = dpi(12),
		widget = wibox.widget.textbox
})

local artist_widget = wibox.widget({
	artist_text,
	widget	= wibox.container.margin,
	top = _G.dpi(5),
	bottom = _G.dpi(5),
})

awesome.connect_signal('bling::playerctl::title_artist_album',
	function(title, artist, art_path)
		art:set_image(gears.surface.load_uncached(art_path))
		title_text:set_markup_silently(
			'<span foreground="' .. beautiful.fg_normal .. '">' .. title .. '</span>'
		)
		artist_text:set_markup_silently(
			'<span foreground="' .. beautiful.fg_focus .. '">' .. artist .. '</span>'
		)
	end
)

local create_button = function(symbol, color, command, playpause)
    local icon = wibox.widget({
        markup	= utils.colorize_text(symbol, beautiful.fg_normal),
        font	= 'FiraCode Nerd Font Regular 15',
        align	= 'center',
        valigin	= 'center',
        widget	= wibox.widget.textbox()
    })

    local button = wibox.widget({
        icon,
        forced_height	= _G.dpi(15),
        forced_width	= _G.dpi(15),
        widget			= wibox.container.background
    })

    awesome.connect_signal('bling::playerctl::status',
		function(playing)
			if playpause then
				if playing then
					icon.markup = utils.colorize_text('', beautiful.fg_normal)
				else
					icon.markup = utils.colorize_text('契', beautiful.fg_normal)
				end
			end
		end
	)

    button:buttons(gears.table.join(
			awful.button({}, 1,
			   function()
				   command()
			   end
			)
		)
	)

	local old_cursor, old_wibox
    button:connect_signal('mouse::enter',
		function()
			icon.markup = utils.colorize_text(icon.text, color)
			local wb = mouse.current_wibox
			old_cursor, old_wibox = wb.cursor, wb
			wb.cursor = 'hand2'
		end
	)

    button:connect_signal('mouse::leave',
		function()
			icon.markup = utils.colorize_text(icon.text, beautiful.fg_normal)
			if old_wibox then
				old_wibox.cursor = old_cursor
				old_wibox = nil
			end
		end
	)

    return button
end

local play_command = function() awful.spawn.with_shell('playerctl play-pause') end
local prev_command = function() awful.spawn.with_shell('playerctl previous') end
local next_command = function() awful.spawn.with_shell('playerctl next') end

local playerctl_play_symbol = create_button('契', beautiful.fg_focus,
                                            play_command, true)

local playerctl_prev_symbol = create_button('玲', beautiful.fg_focus,
                                            prev_command, false)
local playerctl_next_symbol = create_button('怜', beautiful.fg_focus,
                                            next_command, false)

local slider = wibox.widget({
    forced_height		= dpi(5),
    bar_shape			= utils.rrect(beautiful.border_radius),
    shape				= utils.rrect(beautiful.border_radius),
    background_color	= beautiful.bg_normal .. 55,
    color				= beautiful.fg_focus,
    value				= 25,
    max_value			= 100,
    widget				= wibox.widget.progressbar
})

awesome.connect_signal('bling::playerctl::position',
	function(pos, length)
		slider.value = (pos / length) * 100
	end
)

local playerctl = wibox.widget({
	artbox,
	{
		{
			{
				{
					title_widget,
					artist_widget,
					layout = wibox.layout.fixed.vertical
				},
				top = 10,
				left = 25,
				right = 25,
				widget = wibox.container.margin
			},
			{
				nil,
				{
					playerctl_prev_symbol,
					playerctl_play_symbol,
					playerctl_next_symbol,
					spacing = _G.dpi(40),
					layout = wibox.layout.fixed.horizontal
				},
				nil,
				expand = "none",
				layout = wibox.layout.align.horizontal
			},
			{
				slider,
				top = _G.dpi(5),
				left = _G.dpi(25),
				right = _G.dpi(25),
				widget = wibox.container.margin
			},
			layout = wibox.layout.align.vertical
		},
		top = _G.dpi(0),
		bottom = _G.dpi(10),
		widget = wibox.container.margin
	},
	layout = wibox.layout.align.horizontal
})

return section({ widget = playerctl })
