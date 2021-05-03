require('lualine').setup{
	options = {
		theme = 'material-nvim',
		section_separators = {'', ''},
		component_separators = {'', ''},
		disabled_filetypes = {},
		icons_enabled = true,
	},
	sections = {
		lualine_a = { {'mode', upper = true} },
		lualine_b = {
			{
				'branch',
				icon = ''
			},
			{
				'diagnostics',
				sources = { 'nvim_lsp' },
				sections = { 'error', 'warn', 'info' },
				symbols = {error = ' ', warn = ' ', info= ' '},
			},
		},
		lualine_c = { 
			{
				'filename',
				file_status = true,
				symbols = {
					modified = ' MO',
					readonly = ' RO',
				}
			},
		},
		lualine_x = { 'encoding', 'fileformat', 'filetype' },
		lualine_y = { 'progress' },
		lualine_z = { 'location'  },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {}
	},
	extensions = {}
}
