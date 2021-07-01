local awful = require('awful')
local ruled = require('ruled')
local naughty = require('naughty')

ruled.client.connect_signal('request::rules',
	function ()
		-- Global Rules
		ruled.client.append_rule {
			id         = 'global',
			rule       = { },
			properties = {
				focus		= awful.client.focus.filter,
				raise		= true,
				screen		= awful.screen.preferred,
				placement	= awful.placement.no_overlap+awful.placement.no_offscreen
			}
		}

		-- Floating Clients.
		ruled.client.append_rule {
			id       = 'floating',
			rule_any = {
				instance	= { },
				class		= {
					'Lxappearance',
					'Pavucontrol',
					'Pcmanfm',
					'Xfce4-power-manager-settings',
					'Wpg',
					'zoom',
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
		}

		-- Sticky Clients.
		ruled.client.append_rule {
			id			= 'sticky',
			rule_any	= {
				instance	= { },
				class		= { },
				name		= {
					'Picture-in-Picture',
				},
				role		= { },
			},
			properties	= { ontop = true, floating = true, sticky = true }
		}

		-- Add titlebars to normal clients and dialogs
		ruled.client.append_rule {
			id         = 'titlebars',
			rule_any   = { type = { 'normal', 'dialog' } },
			properties = { titlebars_enabled = true }
		}
	end
)

ruled.notification.connect_signal('request::rules',
	function ()
		ruled.notification.append_rule {
			rule       = { },
			properties = {
				screen           = awful.screen.preferred,
				implicit_timeout = 5,
			}
		}
	end
)

-- Lazy focus on mouse enter
client.connect_signal('mouse::enter',
	function(c)
		c:activate { context = 'mouse_enter', raise = false }
	end
)
