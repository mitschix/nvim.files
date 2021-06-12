

" === MAIN VIMRC & BASIC SETTINGS===


" PLugin config files overview{{{
" (can be opened with 'gf')
" plugin/custom/functions.vim           " function to use for mappings
" plugin/custom/abbrev.vim      	    " containing all abbrevations
" plugin/custom/shortcuts.vim   	    " containing all shortcuts
" plugin/custom/statusline.vim  	    " custom statusline with functions - depends on some plugins
" plugin/custom/augroups.vim            " summary of augroups
" plugin/timestamp.vim                  " autoupdater for timestamps
" plugin/plugs/colors.vim   	        " settings for colorscheme and colors
" plugin/plugs/coc.vim                  " coc settings
" plugin/plugs/emoji.vim                " emoji settings
" plugin/plugs/git.vim          	    " settings for git related plugins
" plugin/plugs/snippets.vim     	    " settings for all snippet plugins
" plugin/plugs/tags.vim         	    " settings for primarly gutentags
" plugin/plugs/floaterm.vim             " settings and shortcuts for floaterm
" plugin/plugs/fzf.vim                  " setting for fzf plugin
" plugin/plugs/others.vim        	    " simple settings for other plugins
"}}}

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
set linebreak showbreak=→                                       " wrap long lines at a character in 'breakat' - display start of wrapped lines
set scrolloff=7                                                 " Minimal number of screen lines to keep above/below the cursor.
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

" Source Plug-Plugins File{{{
" source this file seperatly because of buggy behaviour when sourced with
" plugin runtime path
let g:nvim_config_root = stdpath('config')
let plugfile = g:nvim_config_root . '/' . 'plugconf.vim'
if filereadable(plugfile)
    execute 'source ' . plugfile
endif
" source plugins.vim " containing list of plugins for plug
" }}}
