color desert
syntax enable
set cindent
set nu
set showcmd
set pastetoggle=<F6>

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
autocmd FileType c,cpp,python,ruby,java autocmd BufWritePre <buffer> :%s/\s\+$//e
"autocmd FileType c,cpp,java,php,perl,python,ruby,sh autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'
"au FileType c,cpp,h,java,php,perl,python,sh au FileWritePre,BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","":q:))

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
set tags+=/usr/lib/python2.6/site-packages/tags
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
"let g:SuperTabRetainCompletionType=2
"let g:SuperTabDefaultCompletionType="<C-X><C-O>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERFTree tab setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeShowHidden=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERFTree tab setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <F4> :NERDTreeTabsToggle<CR>

" Open NERDTree on console vim startup
let g:nerdtree_tabs_open_on_console_startup=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto-pairs setting
" https://github.com/jiangmiao/auto-pairs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:AutoPairsFlyMode=1 "Default enabled"
"let g:AutoPairsShortcutBackInsert='<M-b>'

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
"Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
Plugin 'cscope.vim'
Plugin 'taglist.vim'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

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
