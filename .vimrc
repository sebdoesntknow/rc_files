syntax on
set expandtab
set ts=4
set nu
colorscheme delek
filetype plugin on

map <F3> : call CompileGcc()<CR>
func! CompileGcc()
  exec "w"
  exec "!gcc % -o %<"
endfunc

map <F4> :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  exec "!gcc % -o %<"
  exec "! ./%<"
endfunc

autocmd! BufNewFile * silent! 0r ~/.vim/skel/perltmp.%:e

