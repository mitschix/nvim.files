

" === BASIC SETTINGS ===



" Basic Settings {{{
" load indentation rules and plugins according to the detected filetype.
filetype plugin indent on
" enable syntax highlighting
syntax on

set autoread                                                    " Automatically read a file that has changed on disk 
set showcmd                                                     " Displays the command in the right corner
set noshowmode                                                  " dont show mode in command line
set hidden                                                      " let modified buffers move to the background
set number relativenumber                                       " linenumbers
set showmatch                                                   " Show matching brackets.
set incsearch nohlsearch ignorecase "smartcase                  " settings for searching
set tabstop=4 softtabstop=4 expandtab shiftwidth=4 smartindent  " indention and formatting
set listchars=tab:»─,nbsp:·,eol:¬,trail:-,extends:»,precedes:«  " Toggle whitespace characters
set whichwrap=b,s,h,l                                           " <BS> <Space> h l <Left> <Right> can change lines
set splitbelow splitright                                       " change split behaviour
set encoding=utf-8 fileencoding=utf-8 fileencodings=utf-8       " encoding
set fileformats=unix,dos,mac                                    " EOL formats order
set foldlevel=99 foldmethod=indent                              " do not fold when opening - fold at indention
" }}}

" Undo Settings {{{
" Persistent undo and controlling swap files
if has('persistent_undo')
    set undodir=$HOME/.config/nvim/undo
    set undofile
    set undolevels=1000
    set undoreload=10000
endif
" }}}

" Autocommands {{{
" Unset paste on InsertLeave.
autocmd InsertLeave * silent! set nopaste

" jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" }}}

