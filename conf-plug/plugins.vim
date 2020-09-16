

" === (PLUG)INS SETTINGS ===


" automatically load vim-plug and install plugins
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" manual installation
" vim -- curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" nvim -- curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" add plugins
call plug#begin('~/.config/nvim/plugged')
" useful tools
Plug 'junegunn/goyo.vim'
Plug 'vimwiki/vimwiki'
Plug 'mbbill/undotree'
Plug 'unblevable/quick-scope'
Plug 'voldikss/vim-floaterm'

" start screen with file type icons
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'

" install fzf as command and as plugin
Plug 'junegunn/fzf', {'do': './install --all --xdg --no-zsh --no-bash' }
Plug 'junegunn/fzf.vim'

" git plugins
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sirver/ultisnips' | Plug 'honza/vim-snippets'

" syntax
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'frazrepo/vim-rainbow'
Plug 'lilydjwg/colorizer' " suggests to use hexokinase
" Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }  -- needs
" termguicolors which destroys complete theme!

" programming
Plug 'tomtom/tcomment_vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'dbeniamine/cheat.sh-vim'
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }
" Plug 'ChristianChiarulli/codi.vim' " cool python repl - very bugy

" tags
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'

" themes
Plug 'flrnprz/plastic.vim'

" others
Plug 'ThePrimeagen/vim-be-good'
Plug 'junegunn/vim-emoji'

" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } } " little buggy
call plug#end()
