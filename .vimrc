" カーソル行をハイライト
	set cursorline
" カレントウィンドウにのみ罫線を引く
	augroup cch
	autocmd! cch
	autocmd WinLeave * set nocursorline
	autocmd WinEnter,BufRead * set cursorline
	augroup END

" [Backspace]の設定
" start : 既存の文字を削除
" eol : 行頭での削除
" indent : オートインデントの削除
set backspace=start,eol,indent
                   
:hi clear CursorLine
:hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black

"-------------------------------
"Codereview plugin
"-------------------------------
:let g:CodeReviewer_reviewer = "yassanet"
:let g:CodeReviewer_reviewFile = "~/revire_yassanet.rev"
:let g:loaded_CodeReviewer = 0

"-------------------------------
"plugin management for neobundle
"-------------------------------
set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/neobundle.vim.git

  call neobundle#rc(expand('~/.vim/bundle'))
endif

NeoBundle 'git://github.com/Shougo/neocomplcache.git'
NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/thinca/vim-ref.git'

filetype plugin on
filetype indent on


set nocompatible
"
"set tags=~/tags
filetype plugin indent on

" display
set number
set ruler
set cmdheight=1
set laststatus=2
"set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set title
set linespace=0
set wildmenu
set showcmd

" syntax color
" color check http://d.hatena.ne.jp/connvoi_tyou/20080306
"" :so $VIMRUNTIME/syntax/hitest.vim :so $VIMRUNTIME/syntax/colortest.vim
syntax on
colorscheme desert
highlight LineNr ctermfg=darkgrey
highlight Pmenu ctermfg=darkblue ctermbg=grey guifg=darkblue guibg=grey
highlight PmenuSel ctermbg=brown guibg=brown
highlight PmenuSbar ctermbg=0 guibg=#404040

" search
set ignorecase
set smartcase
set wrapscan
set hlsearch

" edit
set showmatch
"set autoindent
set cindent
set pastetoggle=<F12>

"tab
set tabstop=4

" keybind
"" kakko
inoremap {} {}<LEFT>
inoremap [] []<LEFT>
inoremap '' ''<LEFT>
inoremap "" ""<LEFT>
inoremap () ()<LEFT>
inoremap <> <><LEFT>
nmap <Space>b :ls<CR>:buffer 
nmap <Space>f :edit .<CR>
nmap <Space>v :vsplit<CR><C-w><C-w>:ls<CR>:buffer
nmap <Space>V :Vexplore!<CR><CR>


" backup
"set backup
"set backupdir=~/vim_backup

"" plugin
" taglist <leader> = \
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_Show_One_File = 0
let Tlist_Use_Right_Window = 1
map <silent> <leader>tl :TlistToggle<cr>

"BufExplorer
map <silent> <leader>be :BufExplorer<cr>

"-------------------------------
"current-func-info
"-------------------------------
let &statusline = '[%f]%m%r%h%w%{"[".(&fenc!="" ? &fenc : &enc)."]"}%=%l/%L,%c%V%8P'
"let &statusline = '[%f]%m%r%h%w%(%{"[".(&fenc!="" ? &fenc : &enc)."]"}%)%{cfi#get_func_name() == "" ? "[no function]" : "[" . cfi#get_func_name() . "()]"}%=%l/%L,%c%V%8P'
"set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

" neocomplcache sample paste
		" Disable AutoComplPop.
        let g:acp_enableAtStartup = 0
        " Use neocomplcache.
        let g:neocomplcache_enable_at_startup = 1
        " Use smartcase.
        let g:neocomplcache_enable_smart_case = 1
        " Use camel case completion.
        let g:neocomplcache_enable_camel_case_completion = 1
        " Use underbar completion.
        let g:neocomplcache_enable_underbar_completion = 1
        " Set minimum syntax keyword length.
        let g:neocomplcache_min_syntax_length = 3
        let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
        
        " Define dictionary.
        let g:neocomplcache_dictionary_filetype_lists = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ 'scheme' : $HOME.'/.gosh_completions'
                \ }
                
        " Define keyword.
        if !exists('g:neocomplcache_keyword_patterns')
            let g:neocomplcache_keyword_patterns = {}
        endif
        let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
        
        " Plugin key-mappings.
        "imap <C-k>     <Plug>(neocomplcache_snippets_expand)
        "smap <C-k>     <Plug>(neocomplcache_snippets_expand)
        "inoremap <expr><C-g>     neocomplcache#undo_completion()
        "inoremap <expr><C-l>     neocomplcache#complete_common_string()
        
        " SuperTab like snippets behavior.
        "imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
        
        " Recommended key-mappings.
        " <CR>: close popup and save indent.
        inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
        " <TAB>: completion.
        inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
        " <C-h>, <BS>: close popup and delete backword char.
        inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
        inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
        inoremap <expr><C-y>  neocomplcache#close_popup()
        inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
        inoremap <expr><C-y>  neocomplcache#close_popup()
        inoremap <expr><C-e>  neocomplcache#cancel_popup()
        
        " AutoComplPop like behavior.
        "let g:neocomplcache_enable_auto_select = 1
        
        " Shell like behavior(not recommended).
        "set completeopt+=longest
        "let g:neocomplcache_enable_auto_select = 1
        "let g:neocomplcache_disable_auto_complete = 1
        "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
        "inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
        
        " Enable omni completion.
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
		autocmd FileType c setlocal omnifunc=ccomplete#Complete
        
        " Enable heavy omni completion.
        if !exists('g:neocomplcache_omni_patterns')
                let g:neocomplcache_omni_patterns = {}
        endif
        let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
        "autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
        let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
	
		"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
		"if !exists('g:neocomplcache_include_paths')
		"		let g:neocomplcache_include_paths = {}
		"endif
		"if !exists(' g:neocomplcache_include_patterns ')
		"		let g:neocomplcache_include_patterns = {}
		"endif
		"let g:neocomplcache_include_paths.c = '/usr/include,/usr/include/linux,/include,/usr/local/include'
		:set path=/usr/include,/usr/include/linux,/include,/usr/local/include
		:set include=^\s*#\s*include

		let g:neocomplcache_snippets_dir = '~/.vim/snippets'
		imap <C-c> <Plug>(neocomplcache_snippets_expand)
		smap <C-c> <Plug>(neocomplcache_snippets_expand)


"--------------------------------------------
" GNU GLOBAL(gtags)
" -------------------------------------------
nmap <C-g> :Gtags -g 
nmap <C-l> :Gtags -f %<CR>
nmap <C-k> :Gtags -r <C-r><C-w><CR>
nmap <C-j> :GtagsCursor<CR>
nmap <C-n> :cn<CR>
nmap <C-p> :cp<CR>



" 自動コメント停止
autocmd FileType * setlocal formatoptions-=ro

" カーソル位置を記憶する
autocmd BufReadPost *
		\ if line("'\"") > 0 && line("'\"") <= line("$") |
		\   exe "normal g`\"" |
        \ endif
