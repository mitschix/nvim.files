# nvim.files
Outsourced dotfiles repository for neovim.

To use my setup just download this repository and create a link to your nvim config folder.

```
git clone https://github.com/mitschix/nvim.files
ln -s /path/to/repo/nvim.files ~/.config/nvim
```

This config is used with nvim v0.5+ and partly rewritten in lua. If you are interested in the vimscript and pre nvim 0.5 config, you can checkout the tag `pre-nvim-0.5`.

```
git checkout pre-nvim-0.5
```

## Custom statusline
Since there is a lot going on in my custom statusline and it is not a plugin, there is a short explanation of my status line:

On the left side of me status line it will show:
+ The current and maximum tab number, if there is another tab open
+ The modification if in a git repository (+ line added, ~ line modified, - line deleted) it will only show them if there are changes
+ The current branch if in a git repository
+ An inidcator for current mode with different colors
+ The absolut path and filename
+ A flag that shows if help page \[Help\]
+ A flag that indicates Read-Only files \[RO\]
+ A flag that indicates if modified \[+\]; \[-\] if modifiable is off


On the right side it will show:
+ A flag for paste mode if enabled
+ A flag for spelling including spellang if enabled
+ The word count indicator with counted words - if word count is activated
+ The filetype
+ The current line / maximum lines
+ The current column
+ A % inidicator of the position in the file,

## Read Repos/dotfiles/posts to find my gems
It took me a long time to comb through a lot of repositorys to find some gems, hopefully this will speed up your journey. (:
Here is a list of some repository I have saved, but there are far more out there.

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
+ [sheerun](https://github.com/sheerun/vimrc)
+ [vim-bootstrap](https://vim-bootstrap.com/)
+ ... there have been far more, unfortunately I have not saved all of them. - sorry ):
