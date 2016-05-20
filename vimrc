set nocompatible               " be iMproved
filetype off                   " required!
let mapleader=","              " Change mapleader

"================================ Basic Setting ================================"
set number
set hlsearch
set ruler
set showcmd
set showmatch
set cursorline
set expandtab
set incsearch
set ignorecase
set mouse=a
set cindent
set backspace=indent,eol,start
set softtabstop=2
set tabstop=2
set shiftwidth=2

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,big5,gbk,latin1
set tags=tags;

colorscheme default
set background=dark

"================================ Vundle Setting ================================"
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

"==================== Status Bar: Airline ===================="
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
set laststatus=2
let g:solarized_termcolors=256
let g:airline_theme='solarized'
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
nnoremap <Leader>b :bd<CR>

"==================== Code snips: ultisnips ===================="
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> with YouCompleteMe.
let g:UltiSnipsSnippetDirectories = [$HOME.'/dotfiles/UltiSnips']
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsEditSplit="vertical"

"==================== Line Number: numbers ===================="
Plugin 'myusuf3/numbers.vim'
let g:numbers_exclude = ['tagbar', 'gundo', 'minibufexpl', 'nerdtree']

"==================== File Mangement: Nerdtree ===================="
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
map <leader>e :NERDTreeToggle<CR>
let g:NERDTreeIndicatorMapCustom = {
      \ "Modified"  : "✹",
      \ "Staged"    : "✚",
      \ "Untracked" : "✭",
      \ "Renamed"   : "➜",
      \ "Unmerged"  : "═",
      \ "Deleted"   : "✖",
      \ "Dirty"     : "✗",
      \ "Clean"     : "✔︎",
      \ "Unknown"   : "?"
      \ }
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

"==================== Git Hotkey: vim-fugitive ===================="
Plugin 'tpope/vim-fugitive'
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gr :Gread<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>ge :Gedit<CR>
nnoremap <silent> <leader>gi :Git add -p %<CR>
nnoremap <silent> <leader>gg :SignifyToggle<CR>

"==================== Youcompleteme ===================="
Plugin 'Valloric/YouCompleteMe'
Plugin 'ervandew/supertab'
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

let g:ycm_global_ycm_extra_conf = '~/dotfiles/ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1

"==================== Syntax Checking: syntastic ===================="
Plugin 'scrooloose/syntastic'
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"==================== Display Indent: vim-indent-guides ===================="
" Usage: <leader> ig
Plugin 'nathanaelkane/vim-indent-guides'
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1

"==================== Trailing Space: ShowTrailingWhitespace ===================="
" To show the trailing whitespace
Plugin 'ShowTrailingWhitespace'
highlight ShowTrailingWhitespace ctermbg=Green guibg=Red

"==================== Easymotion !! ===================="
" To jump everywhere in the source code.
Plugin 'Lokaltog/vim-easymotion'
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>t <Plug>(easymotion-t2)
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

"==================== File Encodings: FenView ===================="
Plugin 'FencView.vim'

"==================== Documentation: Doxygen ===================="
Plugin 'vim-scripts/DoxygenToolkit.vim'
let g:load_doxygen_syntax=1
let g:DoxygenToolkit_authorName="Quexint"

"==================== Git Diff: vim-gitgutter ===================="
Plugin 'airblade/vim-gitgutter'

"==================== Window Management: Taglist ===================="
Plugin 'vim-scripts/taglist.vim'
nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_Show_One_File=0
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1
let Tlist_File_Fold_Auto_Close=1
autocmd BufWritePost *
      \ if filereadable('tags') |
      \   call system('ctags -a '.expand('%')) |
      \ endif

call vundle#end()            " required
syn on
filetype plugin indent on    " required

"==================== Browsing C Code: Cscope ===================="

if has("cscope")
  set csprg=cscope
  set csto=1
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
      cs add cscope.out
  endif
  set csverb
endif

nmap <F7> :!ctags -R <CR> :!cscope -Rbq -P. <CR> :cs reset<CR>

nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"================================ Hotkey Setting ================================"
"" copy / paste
vmap <Leader>c "*y
nmap <Leader>p "*p

map<F3> :w<CR> :make "%<" CFLAGS="-Wall -Wshadow -g -O2 -fno-builtin" CXXFLAGS="-Wall -Wshadow -g -O2 -std=gnu++98"<CR> :cl<CR>
imap<F3> jk<F3>

map<F4> :cp<CR>
imap<F4> jk<F4>

map<F5> :cn<CR>
imap<F5> jk<F5>

map<F6> :!./%< <CR>
imap<F6> jk<F6>

imap <C-d> jkddi

inoremap jk <ESC>
inoremap <esc> <nop>

" Close Quickfix window (,qq)
map <leader>qq :q<CR>

" Better split switching (Ctrl-j, Ctrl-k, Ctrl-h, Ctrl-l)
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" Toggle show tabs and trailing spaces (,n)
set lcs=tab:›\ ,trail:·,eol:␍,nbsp:_
set fcs=fold:-
nnoremap <silent> <leader>n :set nolist!<CR>

"====================[ Make the 81st column stand out ]===================="
highlight ColorColumn ctermbg=Red
call matchadd('ColorColumn', '\%81v', 100)

"====================[ Highlight matches when jumping to next ]===================="
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

"====================[ Always turn on syntax highlighting for diffs ]==================="
augroup PatchDiffHighlight
  autocmd!
  autocmd FileType  diff   syntax enable
augroup END

"==================== Ranger in OS X ===================="
function RangerExplorer()
  exec "silent !ranger --choosefile=/tmp/vim_ranger_current_file " . system('echo "' . expand("%:p:h") . '" | sed -E "s/\ /\\\ /g"')
  if filereadable('/tmp/vim_ranger_current_file')
    exec 'edit ' . system('cat /tmp/vim_ranger_current_file | sed -E "s/\ /\\\ /g"')
    call system('rm /tmp/vim_ranger_current_file')
  endif
  redraw!
endfun
map <Leader>x :call RangerExplorer()<CR>

"==================== To Edit crontab ===================="
au FileType crontab setlocal bkc=yes


"==================== Customized Color ===================="
hi Pmenu                    ctermfg=14 ctermbg=242
hi PmenuSel                 ctermfg=14 ctermbg=1
hi PmenuSbar                ctermfg=14 ctermbg=0
hi SpellBad ctermbg=1
