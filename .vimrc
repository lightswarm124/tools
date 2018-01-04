set nocompatible              	"be iMproved, required
filetype off                  	"required

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

"let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Insert subsequent plugins
Plugin 'scrooloose/nerdtree'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'w0rp/ale'
Plugin 'tomlion/vim-solidity'

"All of your Plugins must be added before the following line
call vundle#end()            	"required
filetype plugin on		        "required
"To ignore plugin indent changes, instead use:
"filetype plugin on

let mapleader=" "
let maplocalleader="//"

syntax enable			        "syntax highlighting
syntax on

set shell=bash			        "set shell environment to bash

"EDITING BEHAVIOR {{{
set showmode			        "always show what mode we're currently editing in
set wrap                        "don't wrap lines
set tabstop=4                   "a tab is four spaces
set softtabstop=4               "when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   "expand tabs by default (overloadable per file type later)
set shiftwidth=4                "number of spaces to use for autoindenting
set autoindent                  "always set autoindenting on
set copyindent                  "copy the previous indentation on autoindenting
set number                      "always show line numbers
set ignorecase                  "ignore case when searching
set scrolloff=4                 "keep 4 lines off the edges of the screen when scrolling
set hlsearch                    "highlight search terms
set incsearch                   "show search matches as you type
set gdefault 			        "search/replace 'globally' (on a line) by default
set backspace=eol,start,indent	"proper backspace behavior
set whichwrap+=<,>,h,l		    "move to next/previous lines
set backspace=indent,eol,start  "Allow backspace in insert mode
set lbr				            "set line break at:
set tw=500			            "    500 characters
set splitbelow                  "Split new screen below current screen
set splitright                  "Split new screen right of current screen
"toggle search highlight
nnoremap <F4> :nohlsearch<CR><CR>
nnoremap <F3> :hlsearch<CR><CR>
nnoremap <leader><Left> :tabprevious<CR><CR>
nnoremap <leader><right> :tabnext<CR><CR>

"toggle line numbers
nnoremap <leader>N :setlocal number!<cr>

"double scrolling speed
nnoremap <C-e> 5<C-y>
nnoremap <C-d> 5<C-e>
"EDITING BEHAVIOR }}}

"EDITOR LAYOUT {{{
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

set termencoding=utf-8
set encoding=utf-8
set lazyredraw                  " don't update the display while executing macros
set laststatus=2                " tell VIM to always put a status line in, even
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

set cmdheight=1                 " use a status bar that is 2 rows high
set ruler			            " Always show current position
set hid				            " Hid buffer when abandoned
"EDITOR LAYOUT }}}

"VIM BEHAVIOR {{{
set hidden                      " hide buffers instead of closing
set switchbuf=useopen           " reveal already opened files from quickfix window
set history=1000                " remember more commands and search history
set undolevels=1000             " set levels of undo
set nobackup                    " do not keep backup files, it's 70's style cluttering
set nowb			            "do not keep backup files
set noswapfile                  " do not write annoying intermediate swap files
set viminfo='20,\"80            " read/write a .viminfo file, don't store more than 80
set cursorline			        " underline the current line, for quick orientation
set background=dark		        "change background colour

"bind fast save
nmap <leader>w :w!<cr>		 
noremap <Leader><CR> :PluginInstall<CR>
noremap <Leader><Tab> :so %<CR> 
"VIM BEHAVIOR }}}

"SYNTAX MODIFICATION {{{

"ALE
let g:ale_linters = {
\   'javascript': ['eslint']
\}
let g:ale_fixers = { 
\   'javascript': ['eslint'] 
\}

nmap <Leader>d <Plug>(ale_fixers)

let g:ale_fix_on_save=1         
let g:ale_completion_enabled = 1


let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0
"SYNTAX MODIFICATION }}}

"NERDTree {{{
autocmd VimEnter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

map <leader>e :NERDTreeFind<CR>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=0
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=1
let g:nerdtree_tabs_open_on_console_startup=1
let g:NERDTreeWinSize=20
noremap <Leader>r :NERDTreeTabsToggle<CR>

""close vim if only nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"NERDTree }}}

"
"Brief help
":PluginList       - lists configured plugins
":PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
":PluginSearch foo - searches for foo; append `!` to refresh local cache
":PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
"see :h vundle for more details or wiki for FAQ
"Put your non-Plugin stuff after this line
