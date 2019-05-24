" interactive-rebase-reverse.vim - Reverse the order of commits in an interactive rebase
" Author:  Sal Ferrarello <https://salferrarello.com/>
" Version: 1.0.0

" Reverse the order of all lines that do NOT:
" - Begin with #
" - nor are a blank link
function! s:Reverse()
  global!/\(^#\)\|\(^$\)/m0
endfunction

" Ensure we only load this file once.
if exists('g:ft_interactive_rebase_reverse')
  finish
endif
let g:ft_interactive_rebase_reverse = 1"

" Reverse the order of all commits in the git interactive rebase screen,
" when this filetype (gitrebase) is loaded.
call s:Reverse()

" Set an autocmd to run when the Buffer is written
augroup fe_interactive_rebase_reverse
	autocmd!
	" Before saving (un)reverse the order of all commits.
	autocmd BufWritePre <buffer> call s:Reverse()
	" After saving reverse the order of the commits again.
	autocmd BufWritePost <buffer> call s:Reverse()
augroup END
