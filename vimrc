" Pathogen: manage plugins in separate directories by manipulating runtimepath.
runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()
filetype plugin indent on

" Colors
set background=dark
colorscheme jellybeans_pda
syntax enable

" Remove vi compadibility
set nocompatible

" Show line numbers
set number

" Smart indenting when starting new line
set smartindent

" Tabs etc
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Allow backspacing over indents and start of insertion point.
set backspace=indent,start

" Highlight trailing whitespace etc
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+\%#\@<!$/

" Make tabs and trailing spaces visible when `list` is set.
set listchars=tab:>-,trail:-

" Needed for multi file editing?
set hidden

" Smart matching
runtime macros/matchit.vim

" Navigatable tab completion from Vim command line
set wildmenu
set wildmode=list:longest

" Ignore case in searches unless contains uppercase.
set ignorecase
set smartcase

" Lines to keep above/bellow curser.
set scrolloff=3

" Swap files in single dir
set backupdir=~/.vim/swap
set directory=~/.vim/swap

" Show lines/column number.
set ruler

" Ding
set visualbell

" short info tokens, short command line messages, no intro.
set shortmess=atI

" History
set history=1000

" Default encoding
set encoding=utf-8

" Show line curser is on
set cursorline

" Fast ttys
set ttyfast

" Last window status line
set laststatus=2

" Resize split panes with mouse within tmux.
" Also get live-updated text selection with mouse drag.
" xterm2: like xterm, plus report position during drag.
set ttymouse=xterm2

" Mouse for scrolling etc in console.
" a = normal + visual + insert + command-line + help files
set mouse=a

" Mapping and escape timeouts.
set timeout
set timeoutlen=1000 " mapped sequences
set ttimeoutlen=10  " escape sequence delay

" PHP whitespace: four space indentation
autocmd FileType php setlocal sts=4 ts=4 sw=4 expandtab

" Keyboard shortcuts
"
" Remap leader
let mapleader = ","

" Make j & k sane, instead of archaic “movement by file line instead of screen line”
nnoremap j gj
nnoremap k gk

" Unbind the cursor keys in insert, normal and visual modes.
for prefix in ['n', 'v']
  for key in ['<Up>', '<Down>', '<Left>', '<Right>']
    exe prefix . "noremap " . key . " <Nop>"
  endfor
endfor

" Arrow keys navigate split windows!
nmap <Up> <C-W><Up>
nmap <Down> <C-W><Down>
nmap <Left> <C-W><Left>
nmap <Right> <C-W><Right>

" Make tabs and trailing spaces visible when requested
nmap <silent> <leader>s :set nolist!<CR>

" Strip whitespaces
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Split window into 2 and 3
noremap <leader>3 <C-w>v<C-w>v
noremap <leader>2 <C-w>v
map <leader>6 <C-w>v<C-w>v<Right><Right><C-w>s<Left><C-w>s<Left><C-w>s

" Convert to Ruby 1.9 hash syntax
noremap <leader>9 :s/:\(\S\+\)\s\+=>\s\+/\1: /g<cr>

" Reselect visual block after indent (thanks @twe4ked)
vnoremap < <gv
vnoremap > >gv

" PLUGINS
" NERDTree
nmap <silent> <leader>n :NERDTreeToggle<CR>

" ctrlp.vim
let g:ctrlp_max_height = 16
let g:ctrlp_custom_ignore = ''
let g:ctrlp_custom_ignore .= '/\..*/\|'
let g:ctrlp_custom_ignore .= '/tmp/\|'
let g:ctrlp_custom_ignore .= 'REGEX_TERMINATOR'
nnoremap <leader>gs :CtrlP spec/<cr>
nnoremap <leader>gm :CtrlP app/models/<cr>
nnoremap <leader>gv :CtrlP app/views/<cr>
nnoremap <leader>gc :CtrlP app/controllers/<cr>

" checksyntax: auto-check Ruby files on save.
if !exists('g:checksyntax')
	let g:checksyntax = {}
	let g:checksyntax['ruby'] = {'auto': 1, 'prepare': 'compiler ruby', 'cmd': 'ruby -c', 'okrx': 'Syntax OK\|No Errors'}
endif

" SuperTab ruby support
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

let g:tagbar_ctags_bin='/usr/local/bin/ctags'
let g:tagbar_width=26
nmap <leader>c :TagbarToggle<CR>

if $TMUX == ''
	    set clipboard+=unnamed
endif

" Airline
" " https://github.com/bling/vim-airline
" " https://github.com/bling/vim-airline/blob/master/doc/airline.txt
let g:airline_left_sep = '▚'
let g:airline_right_sep = '▞'
