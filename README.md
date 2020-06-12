# nvim.files
Outsourced dotfiles repository for nvim + plug.vim. Fully automated setup.


## Custom keymappings 
used \<leader\> is ","

| Mapping          | Command                                     | Mode     | Description |
|------------------|---------------------------------------------|----------|-------------|
| \<leader\>sv     | :so $MYVIMRC\<CR\>                          | nmap     |             |
| \<leader\>ev     | \<C-w\>\<C-v\>\<C-l\>:e $MYVIMRC\<CR\>      | nmap     |             |
| \<C-Tab\>        | :tabnext\<CR\>                              | map      |             |
| \<S-Tab\>        | :bNext\<CR\>                                | nmap     |             |
| \<Tab\>          | :bnext\<CR\>                                | nmap     |             |
| w!!              | %!sudo tee > /dev/null %                    | cmap     |             |
| \<leader\>p      | "+p                                         | noremap  |             |
| \<leader\>y      | "+y                                         | vnoremap |             |
| \<leader\>y      | V"+y                                        | nnoremap |             |
| \<leader\>Y      | "+y                                         | nnoremap |             |
| Y                | y$                                          | nnoremap |             |
| p                | pgvy                                        | xnoremap |             |
| \<C-f\>          | \<C-x\>\<C-f\>                              | imap     |             |
| \<C-]\>          | \<C-x\>\<C-]\>                              | imap     |             |
| \<C-l\>          | \<C-x\>\<C-l\>                              | imap     |             |
| H                | ^                                           | nmap     |             |
| L                | $                                           | nmap     |             |
| j                | gj                                          | nnoremap |             |
| k                | gk                                          | nnoremap |             |
| gj               | j                                           | nnoremap |             |
| gk               | k                                           | nnoremap |             |
| jk               | \<Esc\>                                     | inoremap |             |
| jk               | \<Esc\>                                     | xnoremap |             |
| jk               | \<C-c\>                                     | cnoremap |             |
| \<f3\>           | :call ToggleNetrw()\<CR\>                   | map      |             |
| \<f6\>           | :setlocal spell! spelllang=de_at\<CR\>      | map      |             |
| \<f7\>           | :setlocal spell! spelllang=en_us\<CR\>      | map      |             |
| \<leader\>\<CR\> | o\<Esc\>                                    | map      |             |
| \<leader\>o      | o\<Esc\>                                    | nnoremap |             |
| \<leader\>O      | O\<Esc\>                                    | nnoremap |             |
| \<C-j\>          | \<C-W\>j                                    | map      |             |
| \<C-k\>          | \<C-W\>k                                    | map      |             |
| \<C-h\>          | \<C-W\>h                                    | map      |             |
| \<C-l\>          | \<C-W\>l                                    | map      |             |
| \<C-h\>          | \<C-o\>h                                    | inoremap |             |
| \<C-l\>          | \<C-o\>a                                    | inoremap |             |
| \<C-j\>          | \<C-o\>j                                    | inoremap |             |
| \<C-k\>          | \<C-o\>k                                    | inoremap |             |
| \<Up\>           | :resize +2\<CR\>                            | nnoremap |             |
| \<Down\>         | :resize -2\<CR\>                            | nnoremap |             |
| \<Left\>         | :vertical resize +2\<CR\>                   | nnoremap |             |
| \<Righ\t>        | :vertical resize -2\<CR\>                   | nnoremap |             |
| \<leader\>L      | :set list!\<CR\>                            | map      |             |
| \<leader\>D      | \<C-r>=strftime('%F')\<CR\>                 | inoremap |             |
| \<leader\>D      | i\<C-r>=strftime('%F')\<CR\>\<Esc\>         | nnoremap |             |
| \<leader\>wc     | :call WordCount()\<CR\>                     | nnoremap |             |
| \<leader\>wu     | :call WordCount('update')\<CR\>             | nnoremap |             |
| "\<tab\>         | ""\<Left\>                                  | imap     |             |
| '\<tab\>         | ''\<Left\>                                  | imap     |             |
| (\<tab\>         | ()\<Left\>                                  | imap     |             |
| [\<tab\>         | []\<Left\>                                  | imap     |             |
| {\<tab\>         | {}\<Left\>                                  | imap     |             |
| \<leader\>W      | :%s/\s\+$//\<CR\>:let @/=''\<CR\>           | nmap     |             |
| {\<CR\>          | {\<CR\>}\<Esc\>O                            | imap     |             |
| {;\<CR\>         | {\<CR\>};\<Esc\>O                           | imap     |             |
| \<C-b\>          | Buffers\<CR\>                               | nmap     |             |
| \<C-f\>          | :Files\<CR\>                                | nmap     |             |
| \<leader\>cp     | :set paste / :set nopaste                   | nnoremap |             |
| \<leader\>cn     | :set number! relativenumber!                | nnoremap |             |
| \<leader\>cw     | :set wrap / :set nowrap                     | nnoremap |             |
| \<leader\>cg     | :Goyo                                       | nnoremap |             |
| \<leader\>ch     | :set hlsearch / :set nohlsearch             | nnoremap |             |
| \<leader\>cm     | :set mouse= / :set mouse=a                  | nnoremap |             |
| \<leader\>ct     | :set textwidgt=\<nr\>                       | nnoremap |             |
| \<leader\>cb     | :set background=light / set background=dark | nnoremap |             |
