" vim: syntax=vim
" Environment {
    " Basics {
        set nocompatible        " Must be first line
        set background=dark     " Assume a dark background
    " }

    " Start vim-plug {
        set rtp+=~/.vim/bundle/Vundle.vim
        call vundle#begin()
        Plugin 'VundleVim/Vundle.vim'
    " }
" }

" Bundle {
    " Style {
        " Status Bar - crystalline {
			Plugin 'rbong/vim-crystalline'
			function! StatusLine(current, width)
			  return (a:current ? crystalline#mode() . '%#Crystalline#' : '%#CrystallineInactive#')
					\ . ' %f%h%w%m%r '
					\ . (a:current ? '%#CrystallineFill# %{fugitive#head()} ' : '')
					\ . '%=' . (a:current ? '%#Crystalline# %{&paste?"PASTE ":""}%{&spell?"SPELL ":""}' . crystalline#mode_color() : '')
					\ . (a:width > 80 ? ' %{&ft}[%{&enc}][%{&ffs}] %l/%L %c%V %P ' : ' ')
			endfunction
			
			function! TabLine()
			  let l:vimlabel = has("nvim") ?  " NVIM " : " VIM "
			  return crystalline#bufferline(2, len(l:vimlabel), 1) . '%=%#CrystallineTab# ' . l:vimlabel
			endfunction
			
			let g:crystalline_statusline_fn = 'StatusLine'
			let g:crystalline_tabline_fn = 'TabLine'
			let g:crystalline_theme = 'solarized'
			set showtabline=2
			set laststatus=2
            nnoremap <Leader>z :bp<CR>
            nnoremap <Leader>x :bn<CR>
            nnoremap <Leader>b :Buffers<CR>
        " }

        " indentLine - Show Tab / Leading Spaces {
            Plugin 'Yggdroot/indentLine'
        " }

        " Git Diff - vim-gitgutter {
            Plugin 'airblade/vim-gitgutter'
            let g:gitgutter_async = 0
            " <leader>hp  = GitGutterPreviewHunk
        " }

        " Line Number - numbers {
            Plugin 'myusuf3/numbers.vim'
            let g:numbers_exclude = ['tagbar', 'gundo', 'minibufexpl', 'nerdtree']
        " }

        " Trailing Space - ShowTrailingWhitespace {
            Plugin 'ShowTrailingWhitespace'
            highlight ShowTrailingWhitespace ctermbg=Green guibg=Red
        "}

        " File Encodings - FenView {
            Plugin 'FencView.vim'
        " }
    " }
    " JShint {
        Plugin 'NikolayFrantsev/jshint2.vim'
        nnoremap <silent><F1> :JSHint<CR>

    " }

    " Aligning text - tabular {
        Plugin 'godlygeek/tabular'
    " }
    " vimwiki {
        Plugin 'vimwiki/vimwiki'
        let g:vimwiki_list = [{'path': '~/.dotfiles/vim/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
    " }

    " To-do List - Search Tasks {
        Plugin 'gilsondev/searchtasks.vim'
        let g:searchtasks_list=["TODO", "FIXME", "XXX"]
    " }
    " Additional Text Objects - Targets {
        Plugin 'wellle/targets.vim'
    " }

    " Developer Tools {
        " Code Formater - autoformat {
            Plugin 'Chiel92/vim-autoformat'
            let b:formatdef_custom_c='"clang-format -i"'
            let b:formatters_c = ['custom_c']
        " }
        " Vim Tmux Interact - Vimux {
            Plugin 'benmills/vimux'
        " }

        " Vim Tmux Navigator {
            Plugin 'christoomey/vim-tmux-navigator'
        " }

        " fuzzy finder - fzf {
            Plugin 'junegunn/fzf'
            Plugin 'junegunn/fzf.vim'
            nnoremap <silent> <leader>f :Files<CR>
            nnoremap <silent> <leader>r :Tags<CR>
            imap <c-l> <plug>(fzf-complete-line)

        " }

        " Code snips: ultisnips {
            Plugin 'SirVer/ultisnips'
            Plugin 'honza/vim-snippets'

            " Trigger configuration. Do not use <tab> with YouCompleteMe.
            let g:UltiSnipsSnippetDirectories = [$HOME.'/.dotfiles/vim/UltiSnips']
            let g:UltiSnipsExpandTrigger = "<tab>"
            let g:UltiSnipsJumpForwardTrigger = "<tab>"
            let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
            let g:UltiSnipsEditSplit="vertical"
            let g:snips_author="Quexint"
            let g:ycm_min_num_of_chars_for_completion = 1
            let g:ycm_autoclose_preview_window_after_completion = 1
        " }

        " L9 {
            Plugin 'L9'
        " }

        " Rust {
            Plugin 'rust-lang/rust.vim'
            let g:rust_recommended_style = 0
        " }

        " Search Tool - Ack {
            Plugin 'mileszs/ack.vim'
            if executable('ag')
                let g:ackprg = 'ag --vimgrep --ignore-dir docs --ignore-dir doc --ignore-dir unit-test'
                set grepprg=ag\ --vimgrep\ --ignore-dir\ docs\ --ignore-dir\ doc\ --ignore-dir\ unit-test
                set grepformat=%f:%l:%c:%m,%f:%l:%m
            endif
            cnoreabbrev Ack Ack!
            nnoremap <Leader>a :Ack!<Space>
        " }

        " File Mangement - Nerdtree {
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
                exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
                exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
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
        " }

        " Git Hotkey - vim-fugitive {
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
        " }

        " Youcompleteme {
            Plugin 'Valloric/YouCompleteMe'
            Plugin 'ervandew/supertab'
            " make YCM compatible with UltiSnips (using supertab)
            let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
            let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
            let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

            let g:ycm_global_ycm_extra_conf = '~/.dotfiles/vim/ycm_extra_conf.py'
            nnoremap <C-e> :YcmDiags<CR> <C-j> :lnext<CR>
            nnoremap ]a     :lnext<CR>
            nnoremap [a     :lprevious<CR>
            let g:ycm_autoclose_preview_window_after_completion = 1
            let g:ycm_collect_identifiers_from_tags_files = 1
            let g:ycm_cache_omnifunc=0
            let g:ycm_seed_identifiers_with_syntax = 1
        " }

        " Comment the code - vim-commnetary {
            Plugin 'tpope/vim-commentary'
        " }

        " Display Indent - vim-indent-guides {
            " Usage: <leader> ig
            "Plugin 'nathanaelkane/vim-indent-guides'
            "let g:indent_guides_start_level = 2
            "let g:indent_guides_enable_on_vim_startup = 1
        " }

        " wordmotion {
            Plugin 'chaoren/vim-wordmotion'
        " }
        " Easymotion {
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
        " }

        " Documentation - Doxygen {
            Plugin 'vim-scripts/DoxygenToolkit.vim'
            let g:load_doxygen_syntax=1
            let g:doxygen_enhanced_color=1
            let g:DoxygenToolkit_authorName="Quexint"
            let g:DoxygenToolkit_compactOneLineDoc = "yes"
        " }

        " Function Trace - Tagbar {
            Plugin 'majutsushi/tagbar'
            nnoremap <F8> :TagbarToggle<CR>
        " }
    " }
" }

" Environment {
    " End {
        call vundle#end()            " required
        syn on
        filetype plugin indent on    " required
    " }
" }

" Shell Tools {
    " C {
        " Browsing C Code: Cscope {
        if has("cscope")
            set csprg=cscope
            set csto=1
            set cst
            function! LoadCscope()
                let db = findfile("cscope.out", ".;")
                if (!empty(db))
                    let path = strpart(db, 0, match(db, "/cscope.out$"))
                    set nocscopeverbose " suppress 'duplicate connection' error
                    exe "cs add " . db . " " . path
                    set cscopeverbose
                endif
            endfunction
            au BufEnter /* call LoadCscope()
        endif

        nmap <leader>cs :cs find s <C-R>=expand("<cword>")<CR><CR>
        nmap <leader>cg :cs find g <C-R>=expand("<cword>")<CR><CR>
        nmap <leader>cc :cs find c <C-R>=expand("<cword>")<CR><CR>
        nmap <leader>ct :cs find t <C-R>=expand("<cword>")<CR><CR>
        nmap <leader>ce :cs find e <C-R>=expand("<cword>")<CR><CR>
        nmap <leader>cf :cs find f <C-R>=expand("<cfile>")<CR><CR>
        nmap <leader>ci :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
        nmap <leader>cd :cs find d <C-R>=expand("<cword>")<CR><CR>
        " }
    " }

    " Ranger in OS X {
        function RangerExplorer()
            exec "silent !ranger --choosefile=/tmp/vim_ranger_current_file " . system('echo "' . expand("%:p:h") . '" | sed -E "s/\ /\\\ /g"')
            if filereadable('/tmp/vim_ranger_current_file')
                exec 'edit ' . system('cat /tmp/vim_ranger_current_file | sed -E "s/\ /\\\ /g"')
                call system('rm /tmp/vim_ranger_current_file')
            endif
            redraw!
        endfun
    "    map <Leader>x :call RangerExplorer()<CR>
    " }
" }
