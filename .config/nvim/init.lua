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
require('md-toggleterm')

-- 42 School stuff
vim.cmd('source ~/.config/nvim/vimscript/42.vim')
