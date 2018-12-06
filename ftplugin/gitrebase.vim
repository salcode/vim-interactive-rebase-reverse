" interactive-rebase-reverse.vim - Reverse the order of commits in an interactive rebase
" Author:  Sal Ferrarello <https://salferrarello.com/>
" Version: 0.1.0

" Ensure we only load this file once.
if exists('g:ft_interactive_rebase_reverse')
  finish
endif
let g:ft_interactive_rebase_reverse = 1"

" Reverse the order of all commits in the git interactive rebase screen.
global!/\(^#\)\|\(^$\)/m0

" Set an autocmd to run when the Buffer is written
augroup fe_interactive_rebase_reverse
	autocmd!
	" (Un)reverse the order of all commits in the git interactive rebase screen.
	autocmd BufWrite * global!/\(^#\)\|\(^$\)/m0
augroup END
