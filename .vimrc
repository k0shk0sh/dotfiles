" -- Plugins ---------------------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')
	Plug 'scrooloose/nerdtree'
		autocmd vimenter * NERDTree
		autocmd StdinReadPre * let s:std_in=1
		autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
		map <leader>n :NERDTreeToggle<cr>
		let g:NERDTreeShowHidden=1
		let g:NERDTreeWinSize=30
		let g:NERDTreeAutoDeleteBuffer=1
		let g:NERDTreeShowHidden=1
		let g:NERDTreeShowBookmarks=1
		let g:NERDTreeActivateNode='<Space>'
  	Plug 'aert/vim-powerline'
call plug#end()

" -- Global Configuration --------------------------------------------------------------------------

colorscheme monokai

"syntax on
"syntax enable

"filetype off
"filetype indent on
"filetype plugin on

"set background=dark
"set cursorline
"set noswapfile
"set nobackup
"set nowritebackup
"set scrolloff=5
"set hidden
"set wildmode=longest:list,full
"set wildmenu
"set undofile
"set undodir=~/.vim/undodir
set tabstop=4
set mouse=a
"set conceallevel=0
set relativenumber number
"set splitright
"set splitbelow
"set ignorecase
"set smartcase
"set synmaxcol=500
set nocompatible
set backspace=1

"let g:two_firewatch_italics=1
"let g:one_allow_italics = 1
"let g:material_allow_italics = 1
