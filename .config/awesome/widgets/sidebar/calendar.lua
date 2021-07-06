local gears = require('gears')
local beautiful = require('beautiful')
local wibox = require('wibox')

local section = require('widgets.sidebar.section')
local utils = require('utils')

local styles = {}

styles.header = {
	fg			= beautiful.fg_normal,
	margin_left = _G.dpi(20),
	markup		= function (s) return '<b>'..s:upper()..'</b>' end,
}

styles.focus = {
	fg		= beautiful.fg_normal,
}

local customize = function (widget, flag, date)
	if flag == 'monthheader' then
		flag = 'header'
	end

	local props = styles[flag] or {}

	if props.markup and widget.get_text and widget.set_markup then
        widget:set_markup(props.markup(widget:get_text()))
    end

	if props.align and widget.set_align then
		widget:set_align(props.align)
	end

	local ret = wibox.widget({
		{
			widget,
			margins	= props.margin or 2,
			top		= props.margin_top or _G.dpi(0),
			bottom	= props.margin_bottom or _G.dpi(0),
			left	= props.margin_left or _G.dpi(0),
			right	= props.margin_right or _G.dpi(0),
			widget	= wibox.container.margin,
		},
		fg				= props.fg or beautiful.fg_normal .. 'aa',
		bg				= props.bg or '#00000000',
		shape			= props.shape or nil,
		widget			= wibox.container.background,
	})

	return ret
end

local calendar = wibox.widget({
	date			= os.date('*t'),
	-- date			= { year = 2021, month = 05, day = 06 },
	font			= beautiful.sidebar_title_font,
	fn_embed		= customize,
	spacing			= _G.dpi(10),
	start_sunday	= true,
	widget			= wibox.widget.calendar.month,
})

local w = wibox.widget({
	nil,
	{
		calendar,
		top		= _G.dpi(12),
		bottom	= _G.dpi(12),
		widget	= wibox.container.margin,
	},
	expand	= 'none',
	layout	= wibox.layout.align.horizontal,
})

return section({ widget = w })
