vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto Compile when there are changes in plugins.lua

local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	execute "packadd packer.nvim"
end

-- Function for opt plugins
local function require_plugin(plugin)
	local plugin_prefix = fn.stdpath("data") .. "/site/pack/packer/opt/"

	local plugin_path = plugin_prefix .. plugin .. "/"
	local ok, err, code = os.rename(plugin_path, plugin_path)
	if not ok then
		if code == 13 then
			-- Permission denied, but it exists
			return true
		end
	end
	if ok then
		vim.cmd("packadd " .. plugin)
	end
	return ok, err, code
end

return require('packer').startup(function (use)
	-- Packer
	use 'wbthomason/packer.nvim'

	-- Appearance
	use 'joshdick/onedark.vim'
	use 'hoob3rt/lualine.nvim'
	use 'akinsho/nvim-bufferline.lua'
	use 'kyazdani42/nvim-web-devicons'

	-- T-pope
	use 'tpope/vim-surround'
	use 'tpope/vim-commentary'

	-- LSP
	use 'neovim/nvim-lspconfig'
	use 'kabouzeid/nvim-lspinstall'
	use 'folke/lsp-colors.nvim'
	use 'folke/lsp-trouble.nvim'

	-- Treesitter
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

	-- Compe
	use 'hrsh7th/nvim-compe'

	-- Telescope
	use 'nvim-lua/popup.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope.nvim'
	use 'nvim-telescope/telescope-fzy-native.nvim'

	-- Which Key
	use 'liuchengxu/vim-which-key'
	use { 'AckslD/nvim-whichkey-setup.lua', requires = { 'liuchengxu/vim-which-key' } }

	-- Toggle Terminal
	use 'akinsho/nvim-toggleterm.lua'

	-- TODO Comments
	use 'folke/todo-comments.nvim'

	-- NVIM lint
	use 'mfussenegger/nvim-lint'

	-- Norme.nvim
	use { 'vinicius507/norme.nvim', requires = { 'mfussenegger/nvim-lint' } }
end
)
