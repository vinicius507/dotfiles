if !empty((globpath(&rtp, '/autoload/stdheader.vim')))
	let g:user42 = "vgoncalv"

	command! Stdheader call stdheader#stdheader()
	fun! Header42()
		Stdheader
		let l = line(".")
		let c = col(".")

		6
		execute "normal f<ldt>i" . g:user42 . "@student.42sp.org.br\<esc>052ldw"

		call cursor(l, c)
	endfun
	command! Header42 :call Header42()
	map <F2> :Header42<CR>
	autocmd BufWritePre * call stdheader#update()
endif

if executable('norminette')
	let g:norminette_exec = '/home/vinicius/.asdf/shims/norminette'
	map <F3> :Norminette<CR>
endif
