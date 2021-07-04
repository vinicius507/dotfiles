local wibox = require('wibox')

local utils = require('utils')

local hardware_section = function (section)
	local radial = wibox.widget({
		{
			text			= section:upper(),
			widget			= wibox.widget.textbox,
			align			= 'center',
			forced_width	= _G.dpi(50),
			forced_height	= _G.dpi(50),
		},
		value			= 1,
		min_value		= 0,
		max_value		= 100,
		border_width	= _G.dpi(6),
		border_color	= _G.x.color8,
		color			= _G.x.color1,
		widget			= wibox.container.radialprogressbar,
	})

	local text = wibox.widget({
		markup = utils.colorize_text('0%', _G.x.color7),
		widget = wibox.widget.textbox,
	})

	local w = wibox.widget({
		radial,
		text,
		spacing	= _G.dpi(12),
		spacing_widget = utils.horizontal_pad,
		layout	= wibox.layout.fixed.horizontal,
	})

	awesome.connect_signal('daemon::'..section,
		function (value, title)
			text.markup = utils.colorize_text(title, _G.x.color7)
			radial.value = value
		end
	)

	return w
end

local cpu = hardware_section('cpu')
local ram = hardware_section('ram')

local hardware = wibox.widget({
	widget	= wibox.container.margin,
	top		= _G.dpi(18),
	bottom	= _G.dpi(18),
	left	= _G.dpi(18),
	right	= _G.dpi(18),
})

hardware:setup({
	cpu,
	ram,
    forced_num_cols = 2,
    -- forced_num_rows = 2,
    homogeneous     = true,
    expand          = true,
    layout = wibox.layout.grid
})

return hardware
