# nvim.files
Outsourced dotfiles repository for nvim + plug.vim. Fully automated setup.

This setup is fully automated. It has all needed directorys already setup and will install the rest during first execution.

To use my setup just download this repository and create a link to your nvim config folder

```
git clone https://github.com/mitschix/nvim.files
ln -s /path/to/repo/nvim.files ~/.config/nvim
```

Your will need to have neovim + python and clipboard support already setup.

Below is a list of my shortcuts for quicker review, to see if there is somethink interesting for you, since it took me a long time to comb through a lot of repositorys to find some gems. Hopefully this will speed up your journey. (:

There is a list of some repository I have saved, but there are far more out there.

## Used Plugins
List of used plugins

### useful tools
+ 'kdav5758/TrueZen.nvim' " goyo replacement
+ 'mbbill/undotree'
+ 'unblevable/quick-scope'
+ 'voldikss/vim-floaterm' " todo might be replaced by lspasge - floatterm
+ 'wsdjeg/vim-todo' " TODO broken?
+ 'will133/vim-dirdiff'
+ 'tversteeg/registers.nvim' " previews registers

### File explorer
+ 'kyazdani42/nvim-web-devicons' " for file icons
+ 'kyazdani42/nvim-tree.lua'

### start screen with file type icons
+ 'mhinz/vim-startify'
+ 'ryanoasis/vim-devicons'

### cocsearch replacement @todo configure it
+ 'dyng/ctrlsf.vim'

### fuzzy search utils
+ 'junegunn/fzf', {'do': './install --all --xdg --no-zsh --no-bash' }
+ 'junegunn/fzf.vim'

### git plugins
+ 'nvim-lua/plenary.nvim' " set of lua functions needed by gitsigns
+ 'lewis6991/gitsigns.nvim'

### completion
+ 'sirver/ultisnips'
+ 'honza/vim-snippets'
+ 'hrsh7th/nvim-compe'
### lsps
+ 'neovim/nvim-lspconfig'
+ 'glepnir/lspsaga.nvim'

### syntax
+ 'PotatoesMaster/i3-vim-syntax'
+ 'frazrepo/vim-rainbow'
+ 'norcalli/nvim-colorizer.lua' " needs termguicolors
+ 'nvim-treesitter/nvim-treesitter'

+ 'mechatroner/rainbow_csv'
+ 'andymass/vim-matchup'
+ 'raimon49/requirements.txt.vim', {'for': 'requirements'}

### programming
+ 'terrortylor/nvim-comment'
+ 'dhruvasagar/vim-table-mode'
+ 'dbeniamine/cheat.sh-vim'
+ 'Yggdroot/indentLine'

### tags
+ 'majutsushi/tagbar'
+ 'ludovicchabant/vim-gutentags'

### themes
+ 'mitschix/plastic.vim'

### others
+ 'ThePrimeagen/vim-be-good'

## Custom statusline
Since there is a lot going on in my custom statusline and it is not a plugin, there is a short explanation of my status line:

![Left Side](img/l_statusline.png "left side of the status line")

On the left side of me status line it will show:
+ The current and maximum tab number, if there is another tab open
+ The modification if in a git repository (+ line added, ~ line modified, - line deleted) it will only show them if there are changes
+ The current branch if in a git repository
+ An inidcator for current mode with different colors
+ The absolut path and filename
+ A flag that shows if help page \[Help\]
+ A flag that indicates Read-Only files \[RO\]
+ A flag that indicates if modified \[+\]; \[-\] if modifiable is off


![Right Side](img/r_statusline.png "right side of the status line")

On the right side it will show:
+ A flag for paste mode if enabled
+ A flag for spelling including spellang if enabled
+ The word count indicator with counted words - if word count is activated
+ The filetype
+ The current line / maximum lines
+ The current column
+ A % inidicator of the position in the file,


The  **^** symbols everywhere are there because of the split and indicates your current focused window. Have not found a way to get rid of those. ._.

## Read Repos/dotfiles/posts to find my gems
+ [BrodieRobertson](https://github.com/BrodieRobertson/dotfiles/blob/master/config/nvim/init.vim)
+ [DamianConway](https://github.com/thoughtstream/Damian-Conway-s-Vim-Setup/blob/cbe1fb5b5505e17bd7709669168c367903d94cd4/.vimrc#L1)
+ [nickjj](https://github.com/nickjj/dotfiles/blob/master/.vimrc)
+ [junegunn](https://github.com/junegunn/dotfiles/blob/master/vimrc)
+ [christoomey](https://github.com/christoomey/dotfiles/tree/master/vim/rcfiles)
+ [godlygeek](https://github.com/godlygeek/vim-files/blob/master/.vimrc)
+ [vbrandl](https://github.com/vbrandl/dotfiles/blob/master/editors/vim/vimrc)
+ [ChristianChiarulli](https://github.com/ChristianChiarulli/nvim)
+ [stevelosh](https://stevelosh.com/blog/2010/09/coming-home-to-vim/)
+ [nicknisi](https://github.com/nicknisi/dotfiles/blob/master/config/nvim/init.vim)
+ [uolot](https://github.com/uolot/dotfiles/blob/master/vim/mappings.vim)
+ [vim-bootstrap](https://vim-bootstrap.com/)
+ ... there have been far more, unfortunately I have not saved all of them. - sorry ):
