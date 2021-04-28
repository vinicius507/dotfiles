" Plugins
call plug#begin()

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'dense-analysis/ale'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }

call plug#end()

let g:material_theme_style = 'darker'
colorscheme material

" Set Preferences and Remaps
if (has('termguicolors'))
	set termguicolors
endif

if (has('syntax'))
	syntax on
endif

hi Normal guibg=0
set number
set shiftwidth=4
set tabstop=4
set cursorline
set noshowmode
set hidden

nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

if !exists('g:vscode') 
	" Statusline
	set laststatus=2
	set statusline=
	set statusline+=%5{headers[mode()]}
	set statusline+=%1*
	set statusline+=%4m
	set statusline+=%= " Right side
	set statusline+=%f
	set statusline+=%6y

	let g:headers = {
				\ 'n': 'N  ',           'i': 'I  ',               'R': 'R  ',
				\ 'v': 'V  ',           'V': 'V  ',          "\<c-v>": 'V  ',
				\ 's': 'S  ',           'S': 'S  ',          "\<c-s>": 'S  ',
				\ 'c': 'C  ',           'r': 'P  ',               't': 'T  ',
				\ '!': '!'}
endif


