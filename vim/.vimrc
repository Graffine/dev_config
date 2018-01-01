color desert
syntax enable
set cindent
set nu
set showcmd
set hlsearch
set pastetoggle=<F6>
set backspace=2
inoremap jj <Esc>
let mapleader=','
nnoremap <Leader>rs :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4
set shiftwidth=4
set expandtab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=indent   "fold based on indent
set foldnestmax=2       "deepest fold is 2 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

" Clear spaces on the end of each line when save
autocmd FileType c,cpp,python,go,php,ruby,java,javascript,html,css autocmd BufWritePre <buffer> :%s/\s\+$//e

" Treat .ejs file as .html
autocmd BufRead,BufNewFile *.ejs setfiletype html

autocmd BufRead,BufNewFile *.py map <F5> :% w !python<CR>
map <F7> :set nu!<BAR>set nu?<CR>
map <F8> :set hls!<BAR>set hls?<CR>
nnoremap <CR> i<CR><Esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status Bar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
set statusline=%4*%<\ %1*[%F]
set statusline+=%4*\ %5*[%{&encoding}, " encoding
set statusline+=%{&fileformat}]%m " file format
set statusline+=%4*%=\ %6*%y%4*\ %3*%l%4*,\ %3*%c%4*\ \<\ %2*%P%4*\ \>
highlight User1 ctermfg=red
highlight User2 term=underline cterm=underline ctermfg=green
highlight User3 term=underline cterm=underline ctermfg=yellow
highlight User4 term=underline cterm=underline ctermfg=white
highlight User5 ctermfg=cyan
highlight User6 ctermfg=white 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctags setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tags=tags;
set autochdir

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Taglist setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Auto_Open=1
let Tlist_Exit_OnlyWindow=1 
let Tlist_File_Fold_Auto_Close=1
let Tlist_Inc_Winwidth=0
let Tlist_Show_One_File=0
let Tlist_Use_Right_Window=1
let Tlist_WinWidth=40
nnoremap <silent> <F10> :TlistToggle<CR>
nnoremap <silent> <F9> :wincmd p<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

" [S] Find this C symbol
"nmap cs :cs find s
nmap cs :cs find s <C-R>=expand("<cword>")<CR><CR>

" [G] Find this definition
nmap cg :cs find g <C-R>=expand("<cword>")<CR><CR>

" [C] Find functions calling this function
nmap cc :cs find c <C-R>=expand("<cword>")<CR><CR>

" [T] Find this text string
nmap ct :cs find t <C-R>=expand("<cword>")<CR><CR>

" [E] Find this egreo pattern
nmap ce :cs find e <C-R>=expand("<cword>")<CR><CR>

" [F] Open file by this string
nmap cf :cs find f <C-R>=expand("<cword>")<CR><CR>

" [I] Find files #including this file
nmap ci :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>

" [D] Find functions called by this function
nmap cd :cs find d <C-R>=expand("<cword>")<CR><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Omnicppcomplete setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocp
filetype plugin on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Supertab setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:SuperTabRetainCompletionType=2
" let g:SuperTabDefaultCompletionType="<C-X><C-O>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERFTree tab setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <F4> :NERDTreeTabsToggle<CR>
let g:NERDTreeShowHidden=1

" Open NERDTree on console vim startup
" let g:nerdtree_tabs_open_on_console_startup=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto-pairs setting
" https://github.com/jiangmiao/auto-pairs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:AutoPairsFlyMode=1 "Default enabled"
"let g:AutoPairsShortcutBackInsert='<M-b>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctrlp setting
" https://github.com/kien/ctrlp.vim 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map='<c-t>'
let g:ctrlp_cmd='CtrlP'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
"set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

"let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
"let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows

let g:ctrlp_custom_ignore={
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-commentary setting
" https://github.com/tpope/vim-commentary
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType python,shell set commentstring=#\ %s

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-airline setting
" https://github.com/bling/vim-airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

let g:airline_section_c = '%{getcwd()}/%t'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-easy-align setting
" https://github.com/junegunn/vim-easy-align
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
nmap <Leader>a <Plug>(EasyAlign)"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim-go settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_highlight_functions = 1
let g:go_highlight_methods   = 1
let g:go_highlight_structs   = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently   = 1
let g:go_fmt_autosave        = 1
let g:go_play_open_browser   = 0
let g:go_disable_autoinstall = 1

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)

au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F3> :TagbarToggle<CR>
" autocmd FileType go nested :TagbarOpen

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ag.vim setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ag_working_path_mode='r'
let g:ag_highlight=1
nmap ag :Ag!

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-action-ag setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_action_ag_escape_chars = '#%.^$*+?()[{\\|''}]'
" use * to search current word in normal mode
nmap gac <Plug>AgActionWord
" use * to search selected text in visual mode
vmap gav <Plug>AgActionVisual

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rainbow parentheses setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rbpt_colorpairs = [
    \ ['red',         'firebrick3'],
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ]
" \ ['black',       'SeaGreen3'],

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 1

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
" let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
" let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_phpcs_disable = 1
let g:syntastic_phpmd_disable = 1
let g:syntastic_php_checkers = ['php']
let g:syntastic_quiet_messages = { "type": "style"  }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'bling/vim-airline'

Plugin 'Chun-Yang/vim-action-ag'

Plugin 'ervandew/supertab'

Plugin 'fatih/vim-go'

Plugin 'godlygeek/tabular'

Plugin 'jiangmiao/auto-pairs'

Plugin 'jistr/vim-nerdtree-tabs'

Plugin 'junegunn/vim-easy-align'

Plugin 'kien/ctrlp.vim'
Plugin 'kien/rainbow_parentheses.vim'

Plugin 'mattn/emmet-vim'

Plugin 'majutsushi/tagbar'

Plugin 'nathanaelkane/vim-indent-guides'

Plugin 'rking/ag.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'

Plugin 'terryma/vim-multiple-cursors'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'

" Plugin 'cscope.vim'
Plugin 'taglist.vim'
Plugin 'VisIncr'

" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
