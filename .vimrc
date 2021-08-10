" Basics
set nocompatible
set autoread
" Disable bells
set noeb vb t_vb=
au GUIEnter * set vb t_vb=

syntax on
filetype plugin on

set nu
set expandtab
set tabstop=2
set shiftwidth=2

" Status bar
set laststatus=2
set statusline=%{FugitiveStatusline()}

" https://vim.fandom.com/wiki/Highlight_all_search_pattern_matches
set hlsearch

" netrw
let g:netrw_banner=0 " Remove the horrible banner
let g:netrw_browse_split=4 " open in prior window
let g:netrw_altv=1 " open split to the right
let g:netrw_liststyle=3 " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" Swap : ;
nnoremap ; :
nnoremap : ;

" tab completion
set path+=**
set wildignore+=**/node_modules/** 
" Display all matching files when tab completed
set wildmenu

" Theme stuff
" colorscheme morning
colorscheme murphy

" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" http://vimcasts.org/episodes/fugitive-vim-resolving-merge-conflicts-with-vimdiff/
" Fugitive Conflict Resolution
nnoremap <leader>gd :Gvdiff!<CR>
nnoremap gdt :diffget //2<CR>
nnoremap gdm :diffget //3<CR>

" Window resize
nnoremap <S-h> :vert res +5<CR>
nnoremap <S-l> :vert res -5<CR>
nnoremap <S-j> :res +5<CR>
nnoremap <S-k> :res -5<CR>

" Open term
nnoremap <leader>t :vert term<CR>

" Edit vimrc
nnoremap <leader>vrc :e ~/.vimrc<CR>
" re-source .vimrc
nnoremap <leader>src :source ~/.vimrc<CR>

" Install vim-plugged if not already installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
          silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
            autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
" vim-plug
call plug#begin('~/.vim/plugged')

Plug 'NLKNguyen/papercolor-theme'
Plug 'jacoborus/tender.vim'

" Initialize plugin system
call plug#end()

" General vim stuff I like


" Typescript
" let g:typescript_indent_disable = 1

" Alt mapping https://vi.stackexchange.com/questions/2350/how-to-map-alt-key
"Custom key mappings
execute "set <M-j>=\ej"
execute "set <M-k>=\ek"
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" CoC extensions
let g:coc_global_extensions = ['coc-tsserver','coc-eslint']

" Get Plugins:
"
" Surround: git clone https://github.com/tpope/vim-surround.git ~/.vim/pack/vim-surround/start/vim-surround
"
" TS: git clone https://github.com/leafgarland/typescript-vim.git ~/.vim/pack/typescript/start/typescript-vim
"
" JS: git clone https://github.com/pangloss/vim-javascript.git  ~/.vim/pack/vim-javascript/start/vim-javascript
"
" JSX: git clone git@github.com:MaxMEllon/vim-jsx-pretty.git ~/.vim/pack/vim-jsx-pretty/start/vim-jsx-pretty 
"
" COC: git clone git@github.com:neoclide/coc.nvim.git ~/.vim/pack/coc.nvim/start/coc.nvim
"  - eslint: https://github.com/neoclide/coc-eslint
"  - ts: https://github.com/neoclide/coc-tsserver
"
" https://github.com/tpope/vim-fugitive
" https://medium.com/prodopsio/solving-git-merge-conflicts-with-vim-c8a8617e3633
" Fugitive - git clone https://tpope.io/vim/fugitive.git ~/.vim/pack/fugitive/start/fugitive 
"
" Basics:
" d - delete
" c - change, delete and insert mode
" < - outdent
" > - indent
" v - visual select (mode)
" y - yank, copy text
"
" Deletion
" dtc - delete until c char
" dfc - delete up to c including it
"
" Dealing with long text
" gj
" gk
" g$
" g0
" gq
"
" Capitalization
" ~
" gu
" gU
" 
" Files
" gf - while highlighting the name of a file in text
"
" Selection
" gv - go back to a selected text object
"
" g& - Use the last text replace in the whole file
"
" Text Objects:
" iw - inner word
" it - inner tag
" i" - inner quotes
" ip - inner paragraph
" as - a sentence
"
" Parameterized Text Objects:
" f, F - "find" the next character (including)
" t, T - "find" the next character (excluding)
" / - search (up to the next match)
"
" Vim tips: https://www.youtube.com/watch?v=bQfFvExpZDU
"
" how to do 99% of what plugins do: https://www.youtube.com/watch?v=XA2WjJbmmoM&t=50s
" mastering vim: https://www.youtube.com/watch?v=wlR5gYd6um0 
"
" Moving lines:
" https://vim.fandom.com/wiki/Moving_lines_up_or_down#:~:text=In%20normal%20mode%20or%20in,to%20move%20the%20block%20up.
"
" Completion
" auto-completion mode: ^x
" tag autocompletion for symbols: ^x^]
" tag autocompletion for file names: ^x^f
" context aware autocompletion: ^x^p and ^x^n
" complete entire lines: ^x^l
" omniaware language completion: ^x^o
" Let Vim do the typing https://www.youtube.com/watch?v=3TX3kV3TICU
"
" Pop autocomplete hint: ^p (p stands for "previous" so it looks for past
" iterations of the word you are tryin to autocompelte)
" Pop autocompelte hint forward: ^n
"
" Tutorial VIM+TS+COC
" https://pragmaticpineapple.com/ultimate-vim-typescript-setup/

" autocomplete
" ^x^n - find files within *this* file
" ^x^f - for filenames
" ^x^] - for tags only
" ^n - anything specified by the 'complete' option
" ^n and ^p to go back and forth on the complete list
"
