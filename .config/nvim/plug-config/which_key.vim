nnoremap <silent> <leader> :WhichKey "'"<CR>
let g:which_key_map ={}
let g:which_key_map['1'] = 'which_key_ignore'
let g:which_key_map['2'] = 'which_key_ignore'
let g:which_key_map['3'] = 'which_key_ignore'
let g:which_key_map['4'] = 'which_key_ignore'
let g:which_key_map['5'] = 'which_key_ignore'
let g:which_key_map['6'] = 'which_key_ignore'
let g:which_key_map['7'] = 'which_key_ignore'
let g:which_key_map['8'] = 'which_key_ignore'
let g:which_key_map['9'] = 'which_key_ignore'
let g:which_key_map['q'] = [ 'q', 'kill-buffer' ]
let g:which_key_map['t'] = [ 't', 'terminal' ]
let g:which_key_map['f'] = {
	\ 'name': '+telescope',
	\ 'b' : [ 'b', 'buffers' ],
	\ 'f' : [ 'f', 'files' ],
	\ 'g' : [ 'g', 'rip-grep' ],
	\ 'h' : [ 'h', 'help-tags' ],
	\}
let g:which_key_map['x'] = {
	\ 'name': '+lsp-trouble',
	\ 'd' : [ 'd', 'document' ],
	\ 'l' : [ 'l', 'loclist' ],
	\ 'q' : [ 'q', 'quickfix' ],
	\ 'w' : [ 'w', 'workspace' ],
	\ 'x' : [ 'x', 'toggle' ],
	\}
let g:which_key_centered = 0
let g:which_key_timeout = 300

call which_key#register("'", "g:which_key_map")
