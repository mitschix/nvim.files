

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
Plug 'mcchrish/nnn.vim'
Plug 'junegunn/goyo.vim'
Plug 'vimwiki/vimwiki'
Plug 'mbbill/undotree'
Plug 'unblevable/quick-scope'

" install fzf as command and as plugin
Plug 'junegunn/fzf', {'do': './install --all' }
Plug 'junegunn/fzf.vim'
" git plugins
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" completion

" Plug 'ycm-core/YouCompleteMe', {'do': './install.py'}

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

" tags
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'

" themes
Plug 'flrnprz/plastic.vim'

" others
Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}
Plug 'itchyny/calendar.vim'

" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } } " little buggy
call plug#end()

" " YCM settings
" let g:ycm_key_list_stop_completion = ['<C-y>', '<CR>']
" " disable default blacklist only for markdown - yet
" let g:ycm_filetype_blacklist={'notes': 1, 'netrw': 1, 'unite': 1,
"             \'pandoc': 1, 'tagbar': 1, 'leaderf': 1, 'vimwiki': 1, 'text': 1,
"             \'infolog': 1, 'mail': 1}


