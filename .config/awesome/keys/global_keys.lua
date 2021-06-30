local awful = require('awful')
local gears = require('gears')
local hotkeys_popup = require('awful.hotkeys_popup')
require('awful.hotkeys_popup.keys')
local utils = require('utils')

local user = require('config').user

local global_keys = gears.table.join(
	-- Navigation
	awful.key({ _G.superkey }, 'h',
		function ()
			awful.client.focus.bydirection('left')
		end,
		{ description = 'focus left', group = 'navigation' }
	),
	awful.key({ _G.superkey }, 'j',
		function ()
			awful.client.focus.bydirection('down')
		end,
		{ description = 'focus down', group = 'navigation' }
	),
	awful.key({ _G.superkey }, 'k',
		function ()
			awful.client.focus.bydirection('up')
		end,
		{ description = 'focus up', group = 'navigation' }
	),
	awful.key({ _G.superkey }, 'l',
		function ()
			awful.client.focus.bydirection('right')
		end,
		{ description = 'focus right', group = 'navigation' }
	),

	-- Applications
	-- 	Terminal
	awful.key({ _G.altkey }, 'space',
		function ()
			awful.spawn('dmenu_run')
		end
	),
	awful.key({ _G.superkey }, 'Return',
		function ()
			awful.spawn(user.terminal)
		end
	),

	-- Hotkey Popup
	awful.key({ _G.superkey }, 's',
		function ()
			hotkeys_popup.show_help()
		end,
		{ description = 'show help', group = 'awesome' }
	),

	-- Kill all visible clients for current tag
	awful.key({ _G.superkey, _G.altkey }, 'q',
		function ()
			local clients = awful.screen.focused().clients
			for _, c in pairs(clients) do
				c:kill()
			end
		end
	),

	-- Jump to urgent client. If no client go to the last tag.
	awful.key({ _G.superkey }, 'u',
		function ()
			local uc = awful.client.urgent.get()
			if uc == nil then
				awful.tag.history.restore()
			else
				awful.client.urgent.jumpto()
			end
		end,
		{ description = 'jump to urgent client', group = 'client' }
	),

	-- Reload Awesome
	awful.key({ _G.superkey, _G.shiftkey }, 'r',
		awesome.restart,
		{ description = 'restart awesome', group = 'awesome' }
	),

	-- Quit Awesome
	awful.key({ _G.superkey, _G.shiftkey }, 'e',
		function ()
			awesome.quit()
		end,
		{ description = 'exit awesome', group = 'awesome' }
	),

	-- Layout
	awful.key({ _G.superkey }, 'space',
		function ()
			awful.layout.inc(1)
		end,
		{ description = 'change layout', group = 'awesome' }
	)
)

local ntags = 4
for i = 1, ntags do
	global_keys = gears.table.join(global_keys,
		-- View Tag Only
		awful.key({ _G.superkey }, '#' .. i + 9,
			function ()
				utils.switch_tag(i)
			end,
			{ description = 'view tag #'..i, group = 'tag' }
		),
		-- Toggle Tag Display
		awful.key({ _G.superkey, _G.ctrlkey }, '#' .. i + 9,
			function ()
				local screen = awful.screen.focused()
				local tag = screen.tags[i]
				if tag then
					awful.tag.viewtoggle(tag)
				end
			end,
			{ description = 'toggle tag #'..i, group = 'tag' }
		),
		-- Move Client to Tag
		awful.key({ _G.superkey, _G.shiftkey }, '#' .. i + 9,
			function ()
				if client.focus then
					local tag = client.focus.screen.tags[i]
					if tag then
						client.focus:move_to_tag(tag)
						tag:view_only()
					end
				end
			end,
			{ description = 'move client to tag #'..i, group = 'tag' }
		),
		-- Move All Visible Clients to Tag and Focus that Tag
		awful.key({ _G.superkey, _G.altkey }, '#' .. i + 9,
			function ()
				local tag = client.focus.screen.tags[i]
				local clients = awful.screeen.focused().clients
				if tag then
					for _, c in pairs(clients) do
						c:move_to_tag(tag)
					end
					tag:view_only()
				end
			end,
			{ description = 'move all clients to tag #'..i, group = 'tag' }
		),
		-- Toggle tag on focused client
		awful.key({ _G.superkey, _G.ctrlkey, _G.shiftkey }, '#' .. i + 9,
			function ()
				if client.focus then
					local tag = client.focus.screen.tags[i]
					if tag then
						client.focus:toggle_tag(tag)
					end
				end
			end,
			{ description = 'toggle focused client on tag #'..i, group = 'tag' }
		)
	)
end

return global_keys
