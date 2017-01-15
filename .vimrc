" -- Setup {{{1
" --------------------------------------------------------------------------------------------------

set nocompatible " Use Vim settings, rather than Vi settings
set encoding=utf-8 " Default encoding
set background=dark " Choose dark colors if available
syntax enable " Enable syntax highlighting
colorscheme minimalist " The color scheme
filetype plugin on " Turns on filetype detection for syntax highlighting

" -- Plugins {{{1
" --------------------------------------------------------------------------------------------------

" VimPlug
call plug#begin('~/.vim/plugged')

	Plug 'bling/vim-airline' " Statusline bar & tabline
		set laststatus=2 " Show Airline without NERDTree
		let g:airline_theme='kutsan' " Airline theme
		let g:airline_powerline_fonts = 1 " Show Powerline characters
	Plug 'jiangmiao/auto-pairs' " Insert or delete brackets, parens, quotes in pair
	Plug 'pangloss/vim-javascript' " Vastly improved JavaScript indentation and syntax support
		let g:javascript_plugin_jsdoc = 1 " Enables syntax highlighting for JSDocs

call plug#end()

" -- Options {{{1
" --------------------------------------------------------------------------------------------------

" Editor
set cursorline " Highlight the screen line of the cursor
set mouse=a " Enable mouse use in all modes
set title " Show title in title section
set ruler " Show the line and column number of the cursor position
set wildmenu " Command-line completion operates in an enhanced mode
set wildmode=longest:list,full " wildmenu mode
set backspace=indent,eol,start " Allow backspacing over everything in insert mode
set showcmd " Display key presses at the right bottom
set nowrap " Do not wrap long lines
set showmatch " Show matching parantheses (), {}, [] etc.
set visualbell " Instead of beeping, shows a visual bell on errors
set relativenumber number " Show line numbers as default
set splitright " Splitting a window will put the new window right of the current one
set scrolloff=8 " Minimal number of screen lines to keep above and below the cursor
set lazyredraw " Redraw only when we need to
autocmd InsertEnter * :set norelativenumber " Disable relative numbers in Insert mode
autocmd InsertLeave * :set relativenumber " Enable relative numbers in Normal mode

" Indentation
set tabstop=4 " TAB character length
set shiftwidth=4 " Affects what happens when you press `>>`, `<<` or `==`
set autoindent " Copy the indentation from the previous line, when starting a new line
set smartindent " Automatically inserts one extra level of indentation in some cases

" Search
set hlsearch " Highlight the matched search results
set incsearch " Instantly show results when you start searching like /searchTerm
set ignorecase " Default search is not case sensitive /searchresults
set smartcase " If a uppercase character is entered, the search will be case sensitive

" Backup
set undofile " Undotree to be saved to a file when exiting a buffer
set undodir=~/.vim/temp/undo//
set backupdir=~/.vim/temp/backup//
set directory=~/.vim/temp/swap//

" -- Mappings {{{1
" --------------------------------------------------------------------------------------------------

" ESC to Normal mode
inoremap jk <esc>
inoremap kj <esc>

" Unindent with `Shift + TAB` in Normal and Insert mode
nnoremap <S-Tab> <<
inoremap <S-Tab> <C-d>

" Pane nagivation with ^ + h|j|k|l
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>

" Don't use Ex mode, use Q for formatting and revert with `:unmap Q`
map Q gq

" Map `help` to `vert help` for vertical help split
cnoremap help vert help

" -- Leaders {{{2
" --------------------------------------------------------------------------------------------------

let mapleader=","

nnoremap <leader>w :w<cr>

" }}} vim: foldmethod=marker : foldlevel=0
