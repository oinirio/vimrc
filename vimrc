call plug#begin('~/.vim/plugged')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
	" basic
Plug 'ervandew/supertab'
Plug 'honza/vim-snippets'
Plug 'Lokaltog/vim-easymotion'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-sensible'
Plug 'mhinz/vim-startify'
	" appearance 
Plug 'bling/vim-airline'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'scrooloose/syntastic'
Plug 'tomasr/molokai'
	" edit
Plug 'mbbill/undotree',			{ 'on': 'UndotreeToggle' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
	" browsing
Plug 'ctrlpvim/ctrlp.vim'
Plug 'justinmk/vim-gtfo'
Plug 'scrooloose/nerdtree',		{ 'on': 'NERDTreeToggle' }
	" git
Plug 'airblade/vim-gitgutter'
Plug 'gregsexton/gitv',			{ 'on': 'Gitv' }
Plug 'tpope/vim-fugitive'
	" lang
Plug 'digitaltoad/vim-jade',		{ 'for': 'jade' }
Plug 'fatih/vim-go',				{ 'for': 'go' }
Plug 'groenewege/vim-less',			{ 'for': 'less' }
Plug 'honza/dockerfile.vim',		{ 'for': 'dockerfile' }
Plug 'kchmck/vim-coffee-script',	{ 'for': 'coffee' }
Plug 'klen/python-mode',			{ 'for': 'python'  }
Plug 'VimClojure',					{ 'for': 'clojure' }
Plug 'tpope/vim-fireplace',			{ 'for': 'clojure' }
Plug 'guns/vim-clojure-static',		{ 'for': 'clojure' }
Plug 'guns/vim-clojure-highlight',	{ 'for': 'clojure' }
Plug 'kovisoft/paredit',			{ 'for': 'clojure' }
Plug 'pangloss/vim-javascript',		{ 'for': 'javascript' }
Plug 'vim-ruby/vim-ruby',			{ 'for': 'ruby' }
	" others
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim',				{ 'for': 'html' }
Plug 'thinca/vim-quickrun'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC SETTINGS

set nu
set autoindent
set smartindent
set showcmd
set incsearch
set hlsearch
set ignorecase

set tabstop=4
set shiftwidth=4
set softtabstop=4

set hidden
colorscheme Tomorrow-Night

" 80 chars/line
set textwidth=0
if exists('&colorcolumn')
	set colorcolumn=80
endif

" open on last cursor line
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" 256 colors
set t_Co=256

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEYBINDINGS
let mapleader		= ' '
let maplocalleader	= ' '
imap jj <Esc>

nnoremap jn :NERDTreeToggle<cr>
nnoremap U :UndotreeToggle<cr>

nnoremap <Leader><tab> :bn<cr>
nnoremap <Leader>t :enew<cr>
nnoremap <Leader>l :bn<cr>
nnoremap <Leader>w :bw<cr>
nnoremap <Leader>p :bp<cr>

nnoremap <silent> <C-k> :move-2<cr>
nnoremap <silent> <C-j> :move+<cr>

nnoremap <Leader>e $
nnoremap <Leader>s 0

imap hh <C-y>,<ESC>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" PLUGIN SETTINGS
	" nerdtree
let NERDTreeQuitOnOpen=1

	" airline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t'

	" fugitive
nnoremap <Leader>g :Gstatus<cr>gg<c-n>
nnoremap <Leader>d :Gdiff<cr>

	" indentLine
let g:indentLine_enabled=1

	" undotree
let g:undotree_WindowLayout =2

	"clojure
augroup lisp
	autocmd!
	autocmd FileType lisp.clojure.scheme RainbowParentheses
augroup END
let g:paredit_smartjump =1

" emmet
let g:user_emmet_install_global=0
autocmd FileType html,css EmmetInstall
