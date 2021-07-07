local awful = require('awful')
local ruled = require('ruled')

ruled.client.connect_signal('request::rules',
	function ()
		-- Global Rules
		ruled.client.append_rule({
			id         = 'global',
			rule       = {},
			properties = {
				focus		= awful.client.focus.filter,
				raise		= true,
				screen		= awful.screen.preferred,
				placement	= awful.placement.no_overlap+awful.placement.no_offscreen
			},
		})

		-- Floating Clients.
		ruled.client.append_rule({
			id       = 'floating',
			rule_any = {
				instance	= {},
				class		= {
					'Lxappearance',
					'Pavucontrol',
					'Pcmanfm',
					'Xfce4-power-manager-settings',
					'Wpg',
					'zoom',
					'mpv',
				},
				name		= {
					'Event Tester', -- Xev
				},
				role		= {
					'AlarmWindow',
					'ConfigManager',
					'pop-up',
				}
			},
			properties		= { floating = true, placement = awful.placement.centered }
		})

		-- Sticky Clients.
		ruled.client.append_rule({
			id			= 'sticky',
			rule_any	= {
				instance	= {},
				class		= {},
				name		= {
					'Picture-in-Picture',
				},
				role		= {},
			},
			properties	= { ontop = true, floating = true, sticky = true }
		})

		-- Add titlebars to normal clients and dialogs
		ruled.client.append_rule({
			id         = 'titlebars',
			rule_any   = { type = { 'normal', 'dialog' } },
			properties = { titlebars_enabled = true }
		})

		-- Scratchpads
		ruled.client.append_rule({
			id			= 'termpad',
			rule_any	= {
				instance = {
					'termpad',
				},
			},
			properties	= {
				floating				= true,
				placement				= awful.placement.center_horizontal,
				maximized_horizontal	= true,
				hidden					= true,
			},
		})

		ruled.client.append_rule({
			id			= 'ncmpcpp',
			rule_any	= {
				instance = {
					'ncmpcpp',
				},
			},
			properties	= {
				titlebars_enabled		= false,
				floating				= true,
				placement				= awful.placement.centered,
				maximized_horizontal	= true,
				hidden					= true,
			},
		})
	end
)

ruled.notification.connect_signal('request::rules',
	function ()
		ruled.notification.append_rule({
			rule       = {},
			properties = {
				screen           	= awful.screen.preferred,
				implicit_timeout	= 5,
				x					= _G.screen_width * 0.3,
				y					= _G.screen_height * 0.3,
				height				= _G.screen_height * 0.4,
				width				= _G.screen_width * 0.4,
			}
		})
	end
)

-- Lazy focus on mouse enter
client.connect_signal('mouse::enter',
	function (c)
		c:activate { context = 'mouse_enter', raise = false }
	end
)


-- Hides wibar panel if a client went fullscreen
client.connect_signal('property::fullscreen',
	function (c)
		local visibility = not c.fullscreen
		awesome.emit_signal('panel::visible', c.screen, visibility)
	end
)

-- If client killed was fullscreen, the panel will be visible.
client.connect_signal('unmanage',
	function (c)
		if c.fullscreen then
			awesome.emit_signal('panel::visible', c.screen, true)
		end
	end
)

awesome.connect_signal('panel::visible',
	function (s, visibility)
		if s and s.panel then
			s.panel.visible = visibility
		end
	end
)

-- Jump to urgent clients
client.connect_signal('property::urgent',
	function (c)
		if c.urgent then
			c:jump_to()
		end
	end
)
