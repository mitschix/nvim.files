

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
call plug#begin('~/.config/nvim/vim-plugged')
" useful tools
Plug 'junegunn/goyo.vim'
Plug 'mbbill/undotree'
Plug 'unblevable/quick-scope'
Plug 'voldikss/vim-floaterm'
Plug 'wsdjeg/vim-todo'
Plug 'will133/vim-dirdiff'

" start screen with file type icons
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'

" fuzzy search utils
" install fzf as command and as plugin
Plug 'junegunn/fzf', {'do': './install --all --xdg --no-zsh --no-bash' }
Plug 'junegunn/fzf.vim'

" git plugins

" completion
Plug 'sirver/ultisnips' | Plug 'honza/vim-snippets'

" syntax
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'frazrepo/vim-rainbow'
Plug 'lilydjwg/colorizer' " suggests to use hexokinase

Plug 'mechatroner/rainbow_csv'
Plug 'andymass/vim-matchup'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}

" programming
Plug 'tomtom/tcomment_vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'dbeniamine/cheat.sh-vim'
Plug 'Yggdroot/indentLine'

" tags
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'

" themes
Plug 'mitschix/plastic.vim'

" others

" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } } " little buggy
call plug#end()
