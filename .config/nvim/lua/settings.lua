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
	tabstop = 4,
	shiftwidth = 4,
}

local window_options = {
	number = true,
	cursorline = true,
}

set_options(GLOBAL, global_options)
set_options(BUFFER, buffer_options)
set_options(WINDOW, window_options)

-- Norme.nvim options
vim.cmd "autocmd BufEnter *.c lua require('lint').try_lint()"
vim.cmd "autocmd BufWritePost *.c lua require('lint').try_lint()"
