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

		" Open folders with single-click
		let g:NERDTreeMouseMode=2

		" Open files/folders using space
		let NERDTreeMapActivateNode='<space>'

		" Automatically quit Vim if NERDTree is last and only buffer
		autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

		" Move the cursor to editor when Vim starts up
		autocmd VimEnter * NERDTree | wincmd p

	Plug 'bling/vim-airline'
		let g:airline_powerline_fonts = 1
		let g:airline_theme='quantum'

	Plug 'jiangmiao/auto-pairs'

	Plug 'pangloss/vim-javascript'
		let g:javascript_plugin_jsdoc = 1

call plug#end()

" -- Global Configuration --------------------------------------------------------------------------

" General
set nocompatible " Use Vim settings, rather then Vi settings
set encoding=utf-8 " Default encoding
set cursorline
set mouse=a " Enable mouse use in all modes
set title " Show title in title section
set ruler
set wildmenu

" Editor
set backspace=indent,eol,start " Allow backspacing over everything in insert mode.
set showcmd " Display incomplete commands

map Q gq " Don't use Ex mode, use Q for formatting. Revert with ":unmap Q".

set linespace=0 " Clears the space between lines, more compact
set showmatch " Show matching parantheses (), {}, [] etc.
set hlsearch " Highlight the matched search results
set incsearch " Instantly show results when you start searching like /searchTerm
set ignorecase " Default search is not case sensitive /searchresults
set smartcase " If a uppercase character is entered, the search will be case sensitive
set visualbell " Instead of beeping, shows a visual bell on errors

" Line numbers
set relativenumber number " Show line numbers as default
autocmd InsertEnter * :set norelativenumber " Disable relative numbers in Insert mode
autocmd InsertLeave * :set relativenumber " Enable relative numbers in Normal mode

" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

" Syntax
set background=dark
colorscheme quantum
let g:quantum_italics = 1
let g:quantum_black = 1
set t_Co=256
set cursorline
syntax on

" Indentation
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set cindent
map <Tab> >gv
map <S-Tab> <gv

" Backup
set undodir=~/.vim/temp/undo//
set backupdir=~/.vim/temp/backup//
set directory=~/.vim/temp/swap//

"filetype off
"filetype indent on
"filetype plugin on
"set splitright
"set splitbelow
"set ignorecase
"set smartcase
"set synmaxcol=500
"set conceallevel=0
"set scrolloff=5
"set hidden
"set wildmode=longest:list,full
"set wildmenu
"set undofile

" -- Shortcuts -------------------------------------------------------------------------------------

" ESC to normal mode
imap jj <esc>

" Pane nagivation with ^ + h|j|k|l
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
