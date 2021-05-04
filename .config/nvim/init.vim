if !exists('g:vscode')
	" Plugins
	call plug#begin()

	Plug 'airblade/vim-gitgutter'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-commentary'
	Plug 'neovim/nvim-lspconfig'
	Plug 'kabouzeid/nvim-lspinstall'
	Plug 'folke/lsp-colors.nvim'
	Plug 'hrsh7th/nvim-compe'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'marko-cerovac/material.nvim'
	Plug 'hoob3rt/lualine.nvim'
	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'nvim-lua/popup.nvim'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'folke/lsp-trouble.nvim'
	Plug 'akinsho/nvim-bufferline.lua'
	Plug 'nvim-telescope/telescope-fzy-native.nvim'
	call plug#end()

	" Leaderkey
	let mapleader = "'"

	" Imports
	luafile ~/.config/nvim/plug-config/lsp.lua
	luafile ~/.config/nvim/plug-config/treesitter.lua
	luafile ~/.config/nvim/plug-config/compe.lua
	luafile ~/.config/nvim/plug-config/lsp-trouble.lua
	luafile ~/.config/nvim/plug-config/bufferline.lua
	luafile ~/.config/nvim/themes/config.lua
	luafile ~/.config/nvim/themes/lualine.lua

	" Config
	colorscheme material
	set number
	set shiftwidth=4
	set tabstop=4
	set cursorline
	set noshowmode
	set hidden

	if (has('termguicolors'))
		set termguicolors
	endif

	if (has('syntax'))
		syntax on
	endif

	" Bindiings
	nnoremap <silent> <c-k> :wincmd k<CR>
	nnoremap <silent> <c-j> :wincmd j<CR>
	nnoremap <silent> <c-h> :wincmd h<CR>
	nnoremap <silent> <c-l> :wincmd l<CR>
	nnoremap <silent> <c-t> :bot 15sp \| term<enter>A
	tnoremap <Esc> <C-\><C-n>
	nnoremap <silent> <leader>q <cmd>bdelete!<CR>

	" 42 configuration
	if !empty((globpath(&rtp, '/autoload/stdheader.vim')))
		command! Stdheader call stdheader#stdheader()
		map <F2> :Stdheader<CR>
		autocmd BufWritePre * call stdheader#update()
	endif

	if executable('norminette')
		let g:norminette_exec = '/home/vinicius/.asdf/shims/norminette'
		map <F3> :Norminette<CR>
	endif

	" LSP configuration
	nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
	nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
	" nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
	nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
	nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
	nnoremap <silent> <C-i> <cmd>lua vim.lsp.buf.signature_help()<CR>
	nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
	nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
	nnoremap <silent> <C-d> <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>

	" Compe configuration
	set shortmess+=c

	inoremap <silent><expr> <C-Space> compe#complete()
	inoremap <silent><expr> <CR>      compe#confirm('<CR>')
	inoremap <silent><expr> <C-e>     compe#close('<C-e>')
	inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
	inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

	" Telescope configuration
	nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<CR>
	nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<CR>
	nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<CR>
	nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<CR>
endif
