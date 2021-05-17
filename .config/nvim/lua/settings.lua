local GLOBAL = vim.o
local BUFFER = vim.bo
local WINDOW = vim.wo

local set_options = function(locality, options)
	for key, value in pairs(options) do
		locality[key] = value
	end
end

local global_options = {
	showmode = false,
	hidden = true,
	hlsearch = false,
	shortmess = "filnxToOFc",
	splitright = true,
}

local buffer_options = {
	shiftwidth = 4,
	tabstop = 4,
}

local window_options = {
	number = true,
	cursorline = true,
}

set_options(GLOBAL, global_options)
set_options(BUFFER, buffer_options)
set_options(WINDOW, window_options)

-- Norme.nvim options
vim.cmd "autocmd BufEnter,BufRead *.c,*.h lua require('norme').lint()"
vim.cmd "autocmd BufWritePost *.c,*.h lua require('norme').lint()"
vim.cmd "autocmd InsertLeave *.c,*.h lua require('norme').lint()"
vim.cmd "autocmd TextChanged *.c,*.h lua require('norme').lint()"