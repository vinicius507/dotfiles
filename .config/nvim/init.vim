if !exists('g:vscode')
	" Plugins
	call plug#begin()

	Plug 'airblade/vim-gitgutter'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-commentary'
	Plug 'neovim/nvim-lspconfig'
	Plug 'kabouzeid/nvim-lspinstall'
	Plug 'hrsh7th/nvim-compe'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
	Plug 'kaicataldo/material.vim', { 'branch': 'main' }
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

	call plug#end()

	" Luafiles
	luafile ~/.config/nvim/lsp.lua
	luafile ~/.config/nvim/treesitter.lua
	luafile ~/.config/nvim/compe.lua


	let g:material_theme_style = 'darker'
	colorscheme material

	" Set Preferences and Remaps
	if has('termguicolors')
		set termguicolors
	endif

	if has('syntax')
		syntax on
	endif

	hi Normal guibg=0
	set number
	set shiftwidth=4
	set tabstop=4
	set cursorline
	set noshowmode
	set hidden

	" Random bindiings
	nnoremap <silent> <c-k> :wincmd k<CR>
	nnoremap <silent> <c-j> :wincmd j<CR>
	nnoremap <silent> <c-h> :wincmd h<CR>
	nnoremap <silent> <c-l> :wincmd l<CR>
	nnoremap <silent> <c-t> :bot 15sp \| term<enter>A
	tnoremap <Esc> <C-\><C-n>

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
	nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
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
endif
