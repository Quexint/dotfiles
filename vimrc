" Change mapleader
let mapleader=","

""" Basic Setting """
set nu hls ru sc sm cul nocp et is
set bg=dark
set mouse=a
set cindent
set bs=indent,eol,start

set sw=2
set sts=2
set ts=2

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,big5,gbk,latin1

""" Vundle Setting """
" Brief help
" :PluginList          - list configured Plugins
" :PluginInstall(!)    - install(update) Plugins
" :PluginSearch(!) foo - search(or refresh cache first) for foo
" :PluginClean(!)      - confirm(or auto-approve) removal of unused Plugins
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin command are not allowed..

syn on
set nocompatible               " be iMproved
filetype off                   " required!

"colorscheme solarized
"let g:solarized_termcolors=256

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Status Bar in Vim
"Plugin 'Lokaltog/vim-powerline'
"let g:Powerline_symbols = 'fancy'
"set laststatus=2

Plugin 'altercation/vim-colors-solarized'

" Status Bar in Vim
Plugin 'bling/vim-airline'
set laststatus=2
let g:airline_theme='luna'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>
" 切換buffer的方法
"
" :bn跳下一個buffer
" :bp往上一個buffer
" :b n 跳往第n個buffer
" :bd關掉目前buffer


" Git Status for Vim
Plugin 'tpope/vim-fugitive'

" Syntax checking hacks for vim
Plugin 'scrooloose/syntastic'
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'

" A Vim plugin for visually displaying indent levels in code
" Usage: <leader> ig
Plugin 'nathanaelkane/vim-indent-guides'

" Best Tab
Plugin 'Valloric/YouCompleteMe'
let g:ycm_key_list_select_completion = ['<TAB>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py' " For YouCompleteMe C++ Support
let g:ycm_complete_in_comments=1
set completeopt-=preview
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_collect_identifiers_from_comments_and_strings = 1

" To show the trailing whitespace
Plugin 'ShowTrailingWhitespace'
highlight ShowTrailingWhitespace ctermbg=Green guibg=Red

" To jump everywhere in the source code.
Plugin 'Lokaltog/vim-easymotion'
"let g:EasyMotion_leader_key = '<Leader>'

" Auto detect CJK and Unicode file encodings.
Plugin 'FencView.vim'

" Track the engine.
"Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
"Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

call vundle#end()            " required
filetype plugin indent on    " required


""" Keyboard Setting

vmap <C-c> y:call system("pbcopy", getreg("\""))<CR> " Copy in Mac
nmap <C-v> :call setreg("\"",system("pbpaste"))<CR>p " Paste in Mac

map<F3> :w<CR> :make %< CFLAGS="-Wall -Wshadow -g -O2 -fno-builtin" CXXFLAGS="-Wall -Wshadow -g -O2 -std=gnu++98"<CR> :cl<CR>
imap<F3> <ESC><F3>

map<F4> :cp<CR>
imap<F4> <ESC><F4>

map<F5> :cn<CR>
imap<F5> <ESC><F5>

map<F6> :!./%< <CR>
imap<F6> <ESC><F6>


"====[ Make the 81st column stand out ]====================
highlight ColorColumn ctermbg=Red
call matchadd('ColorColumn', '\%81v', 100)

"=====[ Highlight matches when jumping to next ]=============

" This rewires n and N to do the highlighing...
nnoremap <silent> n   n:call HLNext(0.4)<cr>
nnoremap <silent> N   N:call HLNext(0.4)<cr>

function! HLNext (blinktime)
  highlight RedOnRed ctermfg=red ctermbg=red
  let [bufnum, lnum, col, off] = getpos('.')
  let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
  echo matchlen
  let ring_pat = (lnum > 1 ? '\%'.(lnum-1).'l\%>'.max([col-4,1]) .'v\%<'.(col+matchlen+3).'v.\|' : '')
        \ . '\%'.lnum.'l\%>'.max([col-4,1]) .'v\%<'.col.'v.'
        \ . '\|'
        \ . '\%'.lnum.'l\%>'.max([col+matchlen-1,1]) .'v\%<'.(col+matchlen+3).'v.'
        \ . '\|'
        \ . '\%'.(lnum+1).'l\%>'.max([col-4,1]) .'v\%<'.(col+matchlen+3).'v.'
  let ring = matchadd('RedOnRed', ring_pat, 101)
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  call matchdelete(ring)
  redraw
endfunction

"====[ Always turn on syntax highlighting for diffs ]=========================

filetype on
augroup PatchDiffHighlight
  autocmd!
  autocmd FileType  diff   syntax enable
augroup END

" Better split switching (Ctrl-j, Ctrl-k, Ctrl-h, Ctrl-l)
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

" Toggle show tabs and trailing spaces (,c)
set lcs=tab:›\ ,trail:·,eol:␍,nbsp:_
set fcs=fold:-
nnoremap <silent> <leader>c :set nolist!<CR>

" Close Quickfix window (,qq)
map <leader>qq :cclose<CR>
