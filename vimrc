" Pathogen: manage plugins in separate directories by manipulating runtimepath.
filetype on
filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

" Colors
set background=dark
colorscheme molokai

" Remove vi compadibility
set nocompatible

" Show line numbers
set number

" Tabs etc
set tabstop=2 shiftwidth=2
set smartindent

" Ruby specific tabs
autocmd FileType ruby setlocal sts=2 ts=2 sw=2 et

" Highlight trailing whitespace etc
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+\%#\@<!$/

" Make tabs and trailing spaces visible when requested
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>

" Needed for multi file editing?
set hidden

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

" Can be hacked
set modelines=0

" Show line curser is on
set cursorline

" Fast ttys
set ttyfast

" Default encoding
set encoding=utf-8

" Last window status line
set laststatus=2

" Make j & k sane, instead of archaic “movement by file line instead of screen line”
nnoremap j gj
nnoremap k gk

" Save on focus loss
au FocusLost * :wa

" Autload vimrc on save
autocmd! bufwritepost .vimrc source %

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

nnoremap / \/v
vnoremap / \/v
set gdefault
set incsearch
set showmatch
set hlsearch

" PLUGINS
" fugitive
set statusline=%<%f\ %{fugitive#statusline()}\ %h%m%r%=%-14.(%l,%c%V%)\ %P
