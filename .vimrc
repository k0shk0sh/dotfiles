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

" Interface
set visualbell " Instead of beeping, shows a visual bell on errors
set title " Show title in title section
set lazyredraw " Redraw only when we need to

" Editor
set mouse=a " Enable mouse use in all modes
set scrolloff=8 " Minimal number of screen lines to keep above and below the cursor
set cursorline " Highlight the screen line of the cursor
set backspace=indent,eol,start " Allow backspacing over everything in insert mode
set nowrap " Do not wrap long lines
set showmatch " Show matching parantheses (), {}, [] etc.
set splitright " Splitting a window will put the new window right of the current one
set relativenumber number " Show line numbers as default
autocmd InsertEnter * :set norelativenumber " Disable relative numbers in Insert mode
autocmd InsertLeave * :set relativenumber " Enable relative numbers in Normal mode

" Command Mode
set wildmenu " Command-line completion operates in an enhanced mode
set wildmode=list:longest,list:full " wildmenu mode
set showcmd " Display key presses at the right bottom
set ruler " Show the line and column number of the cursor position
set path+=** " Clever completion with the :find command

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

" File Browsing
let g:netrw_banner = 0 " Disable banner
let g:netrw_liststyle = 3 " Tree view
let g:netrw_browse_split = 4 " Open in prior window
let g:netrw_altv = 1 " Open splits to the right
let g:netrw_winsize = 20 " Specify initial size of new windows made with `(H|V)explorer`

" Backup
set undofile " Undotree to be saved to a file when exiting a buffer
set undodir=~/.vim/temp/undo//
set backupdir=~/.vim/temp/backup//
set directory=~/.vim/temp/swap//

" -- Mappings {{{1
" --------------------------------------------------------------------------------------------------

" ## General {{{2
" ------------------------------------------------

" `jk|kj` to Normal mode
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

" Don't use Ex mode, use Q for formatting and revert with `:unmap Q`
map Q gq

" Map `help` to `vert help` for vertical help split
cnoremap help vert help

" ## Leaders {{{2
" ------------------------------------------------

" Leader key
"let mapleader="\"

" Quick save
nnoremap <leader>w :w<cr>

" Clear highlighting
nnoremap <leader>h :let @/=""<cr>

" -- Functions {{{1
" --------------------------------------------------------------------------------------------------

""
" Autocomplete already-existing words in the file with tab
"
" NOTE
" 	Use CTRL-Y or space to accept and CTRL-E to deny suggestion
""
function InsertTabWrapper()
	let col = col('.') - 1

	if !col || getline('.')[col - 1] !~ '\k'
		return "\<tab>"
	else
		return "\<c-n>"
	endif
endfunction

inoremap <tab> <c-r>=InsertTabWrapper()<cr>

" -- Snippets {{{1
" --------------------------------------------------------------------------------------------------

" TODO

" }}} vim: foldmethod=marker : foldlevel=0
