local awful = require('awful')

local volume_old = -1
local muted_old = -1
local emit_volume_info = function ()
    awful.spawn.easy_async_with_shell(os.getenv('HOME')..'/.config/bin/volume_info',
		function (stdout)
			local volume = stdout:match('Volume: (%d+).*')
			local muted = stdout:match('.*, Mute: (%a+)')
			local is_muted = muted == 'yes'
			local volume_int = tonumber(volume)
			if volume_int ~= volume_old or is_muted ~= muted_old then
				awesome.emit_signal('daemon::volume', volume_int, is_muted)
				volume_old = volume_int
				muted_old = is_muted
			end
		end
	)
end

-- Init
emit_volume_info()

local volume_script = [[
    bash -c "
    LANG=C pactl subscribe 2> /dev/null | grep --line-buffered \"Event 'change' on sink #\"
    "]]


awful.spawn.easy_async({'pkill', '--full', '--uid', os.getenv('USER'), '^pactl subscribe'},
	function (_, _, _, _)
		-- Run emit_volume_info() with each line printed
		awful.spawn.with_line_callback(volume_script, {
			stdout = function (_)
				-- require('naughty').notification({ title = 'Daemon', message = s, app_name='err' })
				emit_volume_info()
			end,
		})
	end
)
