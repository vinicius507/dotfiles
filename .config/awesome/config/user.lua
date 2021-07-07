return {
	name				= 'Vinicius',
	host				= 'myriad',
	terminal			= 'kitty -1',
	floating_terminal	= 'kitty -1',
	editor				= 'neovide',
	player				= 'kitty -1 --class ncmpcpp -o close_on_child_death=yes -e ' .. os.getenv('HOME')..'/.config/bin/music'
}
