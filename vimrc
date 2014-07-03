 syn on
 set nocompatible               " be iMproved
 filetype off                   " required!

 colorscheme default

 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()

 " let Vundle manage Vundle
 Plugin 'gmarik/vundle'

 Plugin 'Lokaltog/vim-powerline'
 let g:Powerline_symbols = 'fancy'
 set laststatus=2
 "set guifont=Source\ Code\ Pro\ for\ Powerline

 Plugin 'tpope/vim-fugitive'

 Plugin 'vitorgalvao/autoswap_mac'

 " My Plugins here:
 "Plugin 'scrooloose/nerdtree'
 "nmap <F2> :NERDTreeToggle <CR> " For NERDTree

 Plugin 'scrooloose/syntastic'

 Plugin 'nathanaelkane/vim-indent-guides'

 Plugin 'Valloric/YouCompleteMe'
 let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py' " For YouCompleteMe C++ Support
 let g:ycm_complete_in_comments=1
 set completeopt-=preview
 let g:ycm_min_num_of_chars_for_completion=1
 let g:ycm_seed_identifiers_with_syntax=1
 let g:ycm_collect_identifiers_from_comments_and_strings = 1


 "Plugin 'taglist.vim'
 "let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
 "let Tlist_Show_One_File = 1
 "let Tlist_Exit_OnlyWindow = 1
 "let Tlist_Use_Right_Window = 1
 "map <silent> <F8> :TlistToggle<CR>

 " To show the trailing whitespace
 Plugin 'ShowTrailingWhitespace'

 " Vary vary useful!! To jump everywhere in the source code.
 Plugin 'Lokaltog/vim-easymotion'
 "let g:EasyMotion_leader_key = '<Leader>'

 " Make YouCompleteMe support Java
 "Plugin "vim-scripts/javacomplete"
 "setlocal omnifunc=javacomplete#Complete
 "setlocal completefunc=javacomplete#CompleteParamsInfo

 " Auto detect CJK and Unicode file encodings.
 Plugin 'FencView.vim'

 " Comment, comment, comment!!
 "Plugin 'The-NERD-Commenter'

 """ Useful but I don't like
 " Complete ()/{}
 " Plugin 'AutoClose'

 " Jump between (), html tags(<p>, <a>, ...etc.)
 " Plugin 'matchit.zip'

 call vundle#end()            " required
 filetype plugin indent on    " required


 """ Keyboard Setting

 vmap <C-c> y:call system("pbcopy", getreg("\""))<CR> " Copy in Mac
 nmap <C-v> :call setreg("\"",system("pbpaste"))<CR>p " Paste in Mac

 map<F3> :w<CR> :!ctags * <CR> :make %<  CFLAGS="-Wall -Wshadow -g -O2 -fno-builtin" CXXFLAGS="-Wall -Wshadow -g -O2 -std=gnu++98"<CR> :cl<CR>
 imap<F3> <ESC><F3>

 map<F4> :cp<CR>
 imap<F4> <ESC><F4>

 map<F5> :cn<CR>
 imap<F5> <ESC><F5>

 map<F6> :!./%< <CR>
 imap<F6> <ESC><F6>

 map<F9> :w<CR> :!python ~/Utilities/UVaSubmit.py %<CR>
 imap<F9> <ESC><F9>

 """ Other Setting
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

"====[ Make the 81st column stand out ]====================
    highlight ColorColumn ctermbg=magenta
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

 " Brief help
 " :PluginList          - list configured Plugins
 " :PluginInstall(!)    - install(update) Plugins
 " :PluginSearch(!) foo - search(or refresh cache first) for foo
 " :PluginClean(!)      - confirm(or auto-approve) removal of unused Plugins
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Plugin command are not allowed..
