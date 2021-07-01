local theme_assets = require('beautiful.theme_assets')

local theme = {}

theme.wallpaper = os.getenv('HOME') .. '/.config/wpg/.current'

theme.font = 'FiraCode Nerd Font Medium 10'

theme.bg_dark		= _G.x.background
theme.bg_normal		= _G.x.color0
theme.bg_focus		= _G.x.color8
theme.bg_minimize	= _G.x.color8
theme.bg_systray 	= _G.x.background

theme.fg_normal		= _G.x.color8
theme.fg_focus		= _G.x.color4
theme.fg_urgent		= _G.x.color3
theme.fg_minimize	= _G.x.color8

theme.useless_gap	= _G.dpi(12)
theme.screen_margin	= _G.dpi(16)

theme.border_width	= _G.dpi(0)
theme.border_normal	= _G.x.color0
theme.border_urgent	= _G.x.color0
theme.border_focus	= _G.x.color0

theme.border_radius = _G.dpi(3)

theme.titlebars_enabled			= true
theme.title_bar_size			= _G.dpi(20)
theme.titlebar_title_enabled	= true
theme.titlebar_font				= 'FiraCode Nerd Font Medium 9'
theme.titlebar_position			= 'top'
theme.titlebar_bg_normal		= _G.x.color0
theme.titlebar_bg_focus			= _G.x.color8
theme.titlebar_fg				= _G.x.color7

theme.notification_position			= 'top_right'
theme.notification_border_width		= _G.dpi(0)
theme.notification_border_radius	= theme.border_radius
theme.notification_border_color		= _G.x.color10
theme.notification_bg				= _G.x.color0
theme.notification_fg				= _G.x.color7
theme.notification_crit_bg			= _G.x.color3
theme.notification_crit_fg			= _G.x.color0
theme.notification_icon_size		= _G.dpi(60)

theme.notification_margin			= _G.dpi(15)
theme.notification_opacity			= 1
theme.notification_font				= theme.font
theme.notification_padding			= theme.screen_margin * 2
theme.notification_spacing			= theme.screen_margin * 2

theme.snap_bg = theme.bg_focus
theme.snap_border_width = _G.dpi(0)

theme.tagnames = {
	'一',
	'二',
	'三',
	'四',
}

theme.separator_text	= '|'
theme.separator_fg		= _G.x.color8

theme.wibar_position		= 'top'
theme.wibar_ontop			= true
theme.wibar_height			= _G.dpi(28)
theme.wibar_bg				= _G.x.color0
theme.wibar_fg				= _G.x.color7
theme.wibar_border_color	= _G.x.color0
theme.wibar_border_width	= _G.dpi(0)
theme.wibar_border_radius	= _G.dpi(0)

theme.prefix_fg = _G.x.color8

theme.taglist_font			= 'umeboshi 10'

theme.taglist_bg_focus		= _G.x.color1
theme.taglist_fg_focus		= _G.x.color1

theme.taglist_bg_occupied	= _G.x.color0
theme.taglist_fg_occupied	= _G.x.color7

theme.taglist_bg_urgent		= _G.x.color0
theme.taglist_fg_urgent		= _G.x.color9

theme.taglist_bg_empty		= _G.x.color0
theme.taglist_fg_empty		= _G.x.color8

theme.taglist_spacing		= _G.dpi(0)
theme.taglist_disable_icon	= true

local taglist_square_size = _G.dpi(0)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
taglist_square_size, theme.fg_focus
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_sel(
taglist_square_size, theme.fg_normal
)

-- TODO: titlebar icons, layout icons, icon_theme

return theme
