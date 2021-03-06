local theme_assets = require('beautiful.theme_assets')

local theme = {}

theme.wallpaper = os.getenv('HOME') .. '/.config/wpg/.current'
theme.profile_picture = os.getenv('HOME') .. '/Pictures/pp.jpg'

theme.font = 'FiraCode Nerd Font Medium 10'

theme.bg_dark		= _G.x.background
theme.bg_normal		= _G.x.color0
theme.bg_focus		= _G.x.color8
theme.bg_minimize	= _G.x.color8
theme.bg_systray 	= _G.x.background

theme.fg_normal		= _G.x.color7
theme.fg_focus		= _G.x.color1
theme.fg_urgent		= _G.x.color9
theme.fg_minimize	= _G.x.color7

theme.useless_gap	= _G.dpi(12)
theme.screen_margin	= _G.dpi(16)

theme.border_width	= _G.dpi(0)
theme.border_normal	= _G.x.color0
theme.border_urgent	= _G.x.color0
theme.border_focus	= _G.x.color0

theme.border_radius = _G.dpi(3)

theme.titlebars_enabled			= true
theme.titlebar_size				= _G.dpi(30)
theme.titlebar_title_enabled	= true
theme.titlebar_font				= 'FiraCode Nerd Font Medium 9'
theme.titlebar_position			= 'top'
theme.titlebar_bg_normal		= _G.x.color0
theme.titlebar_bg_focus			= _G.x.color8
theme.titlebar_bg_urgent		= _G.x.color8
theme.titlebar_fg_normal		= _G.x.color7
theme.titlebar_fg_focus			= _G.x.color12
theme.titlebar_fg_urgent		= _G.x.color9

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

theme.taglist_bg_focus		= _G.x.color12
theme.taglist_fg_focus		= _G.x.color12

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

theme.exit_popup_fg					= _G.x.color15
theme.exit_popup_bg					= theme.bg_normal
theme.exit_popup_button_bg_normal	= _G.x.color8 .. 'aa'
theme.exit_popup_button_bg_focus	= _G.x.color8
theme.exit_popup_poweroff_color		= _G.x.color9
theme.exit_popup_reboot_color		= _G.x.color1
theme.exit_popup_suspend_color		= _G.x.color4
theme.exit_popup_exit_color			= _G.x.color12
theme.exit_popup_lock_color			= _G.x.color13
theme.exit_popup_icon_font			= 'FiraCode Nerd Font Medium 20'

theme.layout_icons = {
	dwindle 	= '﩯',
	floating	= '缾',
	max			= '',
}

theme.layout_icon_font	= 'FiraCode Nerd Font Medium 16'
theme.layout_icon_color = theme.taglist_fg_focus

theme.sidebar_bg			= theme.bg_dark
theme.sidebar_fg			= theme.fg_normal
theme.sidebar_border_radius	= _G.dpi(5)
theme.sidebar_section_bg	= theme.bg_focus .. '66'
theme.sidebar_title_fg		= theme.fg_normal .. '55'
theme.sidebar_opacity		= 1
theme.sidebar_width			= _G.dpi(350)
theme.sidebar_position		= 'left'
theme.sidebar_title_font	= 'FiraCode Nerd Font Medium 10'
theme.sidebar_profile_font	= 'FiraCode Nerd Font Medium 12'
theme.sidebar_clock_font	= 'M+ 1m regular 36'


theme.tabbar_ontop		= false
theme.tabbar_radius		= _G.dpi(0)
theme.tabbar_style		= 'default'
theme.tabbar_font		= theme.font
theme.tabbar_size		= 40
theme.tabbar_position	= 'top'
theme.tabbar_bg_normal	= theme.bg_normal
theme.tabbar_fg_normal	= theme.fg_normal
theme.tabbar_bg_focus	= theme.bg_focus
theme.tabbar_fg_focus	= theme.fg_focus

theme.mstab_bar_ontop = true
theme.mstab_dont_resize_slaves = false
theme.mstab_bar_padding = _G.dpi(-3)
theme.mstab_border_radius = _G.dpi(0)
theme.mstab_bar_height = 40
theme.mstab_tabbar_position = 'top'
theme.mstab_tabbar_style = 'default'

theme.flash_focus_start_opacity = 0.6
theme.flash_focus_step = 0.01

return theme
