local awful = require("awful")

local update_interval = 5
local ram_script = [[
  sh -c "
  free -m | grep 'Mem:' | awk '{printf \"%d@@%d@\", $7, $2}'
  "]]

awful.widget.watch(ram_script, update_interval,
	function(_, stdout)
		local available = stdout:match('(.*)@@')
		local total = stdout:match('@@(.*)@')
		local used = tonumber(total) - tonumber(available)
		local percentage = used / tonumber(total) * 100
		awesome.emit_signal('daemon::ram', percentage, string.format('%.0f%%', percentage))
	end
)
