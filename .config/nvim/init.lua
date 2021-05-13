require('plugins')

-- Load Configurations
require('colorscheme')
require('settings')

-- Keybindings
require('keybindings')

-- Load Plugins Configuration
require('lsp')
require('lsp-trouble')
require('treesitter')
require('md-telescope')
require('md-compe')
require('md-bufferline')
require('md-lualine')
require('whichkey')

-- 42 School stuff
function exists(path)
	local ok, err, code = os.rename(path, path)
	if not ok then
		if code == 13 then
			return true -- Permission denied, but it exists
		end
	end
	return ok, err
end

function ecole42()
	local path = '/home/vinicius/.config/nvim/vimscript/42.vim'
	if exists(path) then
		vim.cmd('source ~/.config/nvim/vimscript/42.vim')
	end
end

ecole42()
