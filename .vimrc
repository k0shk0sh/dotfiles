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

		" Automatically quit Vim if NERDTree is last and only buffer
		autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

		" Move the cursor to editor when vim starts up.
		autocmd VimEnter * NERDTree | wincmd p

	Plug 'bling/vim-airline'
		let g:airline_powerline_fonts = 1
		let g:airline_theme = "laederon"

		Plug 'edkolev/tmuxline.vim'

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
syntax enable
set relativenumber number

" Syntax
syntax on
colorscheme monokai
set t_Co=256
set cursorline

" Color Scheme
let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1

" Indentation
set tabstop=4
set backspace=1
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

" Other
"let g:two_firewatch_italics=1
"let g:one_allow_italics = 1
"let g:material_allow_italics = 1

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