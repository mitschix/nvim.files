

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
Plug 'kdav5758/TrueZen.nvim' " goyo replacement
Plug 'mbbill/undotree'
Plug 'unblevable/quick-scope'
Plug 'voldikss/vim-floaterm' " todo might be replaced by lspasge - floatterm
Plug 'wsdjeg/vim-todo' " TODO broken?
Plug 'will133/vim-dirdiff'
Plug 'tversteeg/registers.nvim' " previews registers

" File explorer
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

" start screen with file type icons
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'

" cocsearch replacement @todo configure it
Plug 'dyng/ctrlsf.vim'

" fuzzy search utils
" install fzf as command and as plugin
Plug 'junegunn/fzf', {'do': './install --all --xdg --no-zsh --no-bash' }
Plug 'junegunn/fzf.vim'

" git plugins
Plug 'nvim-lua/plenary.nvim' " set of lua functions needed by gitsigns
Plug 'lewis6991/gitsigns.nvim'

" completion
Plug 'sirver/ultisnips' | Plug 'honza/vim-snippets'
Plug 'hrsh7th/nvim-compe'
" lsps
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'ray-x/lsp_signature.nvim'

" syntax
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'frazrepo/vim-rainbow'
Plug 'norcalli/nvim-colorizer.lua' " needs termguicolors
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'mechatroner/rainbow_csv'
Plug 'andymass/vim-matchup'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}

" programming
Plug 'terrortylor/nvim-comment'
Plug 'dhruvasagar/vim-table-mode'
Plug 'dbeniamine/cheat.sh-vim'
Plug 'Yggdroot/indentLine'

" tags
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'

" themes
Plug 'mitschix/plastic.vim'

" others
Plug 'ThePrimeagen/vim-be-good'
call plug#end()
