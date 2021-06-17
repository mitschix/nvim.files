# Custom keymappings

used \<leader\> is ","

| Mapping          | Command                                     | Mode     | Description                                                  |
|------------------|---------------------------------------------|----------|--------------------------------------------------------------|
| \<leader\>sv     | :so $MYVIMRC\<CR\>                          | nmap     | Source config file                                           |
| \<leader\>ev     | \<C-w\>\<C-v\>\<C-l\>:e $MYVIMRC\<CR\>      | nmap     | Edit config file in vertical split                           |
| \<leader\>\<CR\> | :w\<CR\>                                    | map      | Quick save                                                   |
| \<C-Tab\>        | :tabnext\<CR\>                              | map      | Switch to next Tab                                           |
| \<S-Tab\>        | :bNext\<CR\>                                | nmap     | Switch to next Buffer                                        |
| \<Tab\>          | :bnext\<CR\>                                | nmap     | Switch to next Buffer                                        |
| :w!!             | %!sudo tee > /dev/null %                    | cmap     | Write read only file                                         |
| \<leader\>p      | "+p                                         | noremap  | Paste from system clipboard                                  |
| \<leader\>y      | "+y                                         | vnoremap | Yank visual selection to system clipboard                    |
| \<leader\>y      | V"+y                                        | nnoremap | Yank whole line to system clipboard                          |
| \<leader\>Y      | "+y                                         | nnoremap | Enable Yank mode for next command (e.g w[ord])               |
| Y                | y$                                          | nnoremap | Yank till the rest of the line                               |
| p                | pgvy                                        | xnoremap | Do not overwrite Buffer with paste                           |
| x/X              | "_x/"_X                                     | nnoremap | Do not overwrite Buffer when cut out
| \<C-f\>          | \<C-x\>\<C-f\>                              | imap     | More convienient way to complete files with ^X               |
| \<C-]\>          | \<C-x\>\<C-]\>                              | imap     | More convienient way to complete tags with ^X                |
| \<C-l\>          | \<C-x\>\<C-l\>                              | imap     | More convienient way to complete lines with ^X               |
| H                | ^                                           | nmap     | Jump to beginning of line                                    |
| L                | $                                           | nmap     | Jump to end of line                                          |
| j                | gj                                          | nnoremap | Move one visual line down (even when wrapped)                |
| k                | gk                                          | nnoremap | Move one visual line up (even when wrapped)                  |
| gj               | j                                           | nnoremap | Use default behaviour of j                                   |
| gk               | k                                           | nnoremap | Use default behaviour of k                                   |
| jk               | \<Esc\>                                     | inoremap | Escape mode                                                  |
| jj               | \<Esc\>                                     | inoremap | Escape mode                                                  |
| jk               | \<Esc\>                                     | xnoremap | Escape mode                                                  |
| jk               | \<C-c\>                                     | cnoremap | Escape mode                                                  |
| \<f5\>           |                                             |          | Toggle Paste mode                                            |
| \<f6\>           | :setlocal spell! spelllang=de_at\<CR\>      | map      | Toggle spelling in german                                    |
| \<f7\>           | :setlocal spell! spelllang=en_us\<CR\>      | map      | Toggle spelling in english                                   |
| \<leader\>o      | o\<Esc\>                                    | nnoremap | Add line below curser                                        |
| \<leader\>O      | O\<Esc\>                                    | nnoremap | Add line above curser                                        |
| \<C-j\>          | \<C-W\>j                                    | map      | Remap window movement to not need \<C-W\> prepanded          |
| \<C-k\>          | \<C-W\>k                                    | map      | Remap window movement to not need \<C-W\> prepanded          |
| \<C-h\>          | \<C-W\>h                                    | map      | Remap window movement to not need \<C-W\> prepanded          |
| \<C-l\>          | \<C-W\>l                                    | map      | Remap window movement to not need \<C-W\> prepanded          |
| \<C-h\>          | \<C-o\>h                                    | inoremap | Enable movement in insert mode with h                        |
| \<C-l\>          | \<C-o\>a                                    | inoremap | Enable movement in insert mode with l                        |
| \<C-j\>          | \<C-o\>j                                    | inoremap | Enable movement in insert mode with j                        |
| \<C-k\>          | \<C-o\>k                                    | inoremap | Enable movement in insert mode with k                        |
| \<A-h\>          | :resize +2\<CR\>                            | nnoremap | Remap arrow keys to not use them (or only to resize windows) |
| \<A-l\>          | :resize -2\<CR\>                            | nnoremap | Remap arrow keys to not use them (or only to resize windows) |
| \<A-j\>          | :vertical resize +2\<CR\>                   | nnoremap | Remap arrow keys to not use them (or only to resize windows) |
| \<A-k>           | :vertical resize -2\<CR\>                   | nnoremap | Remap arrow keys to not use them (or only to resize windows) |
| ;D               | \<C-r>=strftime('%F')\<CR\>                 | inoremap | Insert current date YYYY-MM-DD format                        |
| \<leader\>D      | i\<C-r>=strftime('%F')\<CR\>\<Esc\>         | nnoremap | Insert current date YYYY-MM-DD format                        |
| \<leader\>wc     | :call WordCount()\<CR\>                     | nnoremap | Toggle word count on/off                                     |
| \<leader\>wu     | :call WordCount('update')\<CR\>             | nnoremap | Update word count                                            |
| "\<tab\>         | ""\<Left\>                                  | imap     | add second " and enters surrounding                          |
| '\<tab\>         | ''\<Left\>                                  | imap     | add second ' and enters surrounding                          |
| (\<tab\>         | ()\<Left\>                                  | imap     | add closing ) and enters surrounding                         |
| [\<tab\>         | []\<Left\>                                  | imap     | add closing ] and enters surrounding                         |
| {\<tab\>         | {}\<Left\>                                  | imap     | add closing } and enters surrounding                         |
| {\<CR\>          | {\<CR\>}\<Esc\>O                            | imap     | add closing } line breaks and enters surrounding above       |
| {;\<CR\>         | {\<CR\>};\<Esc\>O                           | imap     | add closing }; line breaks and enters surrounding above      |
| \<leader\>W      | :%s/\s\+$//\<CR\>:let @/=''\<CR\>           | nmap     | Strip trailing white spaces                                  |
| \<leader\>cp     | :set paste / :set nopaste                   | nnoremap | Toggle paste mode                                            |
| \<leader\>cl     | :set list / :set nolist                     | nnoremap | Toggle list option - show tabs and spaces (listchars)        |
| \<leader\>cn     | :set number! relativenumber!                | nnoremap | Toggle line all numbers                                      |
| \<leader\>cw     | :set wrap / :set nowrap                     | nnoremap | Toggle wrap                                                  |
| \<leader\>ch     | :set hlsearch / :set nohlsearch             | nnoremap | Toggle highlight of searched word                            |
| \<leader\>cm     | :set mouse= / :set mouse=a                  | nnoremap | Toggle mouse support                                         |
| \<leader\>ct     | :set textwidgt=\<nr\>                       | nnoremap | Change textwidth to given number                             |
| \<leader\>cb     | :set background=light / set background=dark | nnoremap | Toggle background to dark/light                              |
| -                | -                                           | -        | TBD - for more infos look at maps.md|


## Custom Key Mapping for Plugins

| Mapping               | Command                                       | Mode     | Description                                                      |
|-----------------------|-----------------------------------------------|----------|------------------------------------------------------------------|
| \<leader\>b           | Buffers\<CR\>                                 | nnoremap | Use fzf Buffers command to switch buffer                         |
| \<leader\>e           | :Fzf -m\<CR\>                                 | nnoremap | Use fzf Files command to switch file                             |
| \<leader\>\<leader\>h | :History:\<CR\>                               | nmap     | Use fzf History command to show and select history               |
| \<leader\>cg          | :Goyo                                         | nnoremap | Toggle Goyo - Plugin to Focus editor and disable distraction     |
| \<leader\>u           | :UndotreeToggle\<CR\>                         | nmap     | Toggle Undotree - Plugin to follow multiple undo trees  |
| \<f2\>                | :CocCommand explorer\<CR\>                    | nmap     | Toggle coc-explorer                                              |
| \<f3\>                | :CocCommand explorer --present floating\<CR\> | nmap     | Toggle coc-explorer in floating                                  |
| \<f4\>                | :Tagbar\<CR\>                                 | map      | Toggle bar for tags                                              |
| \<f8\>                | :call ToggleGStatus()\<CR\>                   | map      | Toggle git status                                                |
| )                     | <Plug>(GitGutterNextHunk)                     | nmap     | Jump to the next hunk of GitGutter                               |
| (                     | <Plug>(GitGutterPrevHunk)                     | nmap     | Jump to the previous hunk of GitGutter                           |
| -                     | -                                             | -        | For Coc-Settings/Shortcuts see plugin/plugs/coc.vim              |

## Others not formatted
plugin/scratchpad.vim:nnoremap <leader><leader>x :call <SID>save_and_exec()<CR>
plugin/scratchpad.vim:nnoremap <leader>rr :%s/<c-r><c-w>//g<left><left><left>
plugin/scratchpad.vim:nnoremap <leader>rc :%s/<c-r><c-w>//gc<left><left><left>
plugin/scratchpad.vim:vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

plugin/scratchpad.vim:noremap <leader><Tab> <Esc>/<++><Enter>"_c4l
plugin/scratchpad.vim:inoremap <leader><Tab> <Esc>/<++><Enter>"_c4l
plugin/scratchpad.vim:vnoremap <leader><Tab> <Esc>/<++><Enter>"_c4l
plugin/scratchpad.vim:inoremap ;g <++>
plugin/scratchpad.vim:nnoremap go o<Esc>
plugin/scratchpad.vim:nnoremap gO O<Esc>j
plugin/scratchpad.vim:inoremap jj <Esc>A
plugin/scratchpad.vim:inoremap jn <Esc>o
plugin/scratchpad.vim:inoremap <leader>dd <Esc>ddi
plugin/scratchpad.vim:inoremap <leader>> <esc>>>a
plugin/scratchpad.vim:inoremap <leader>< <esc><<a
plugin/scratchpad.vim:nnoremap <Leader>pf :GFiles<CR>
plugin/scratchpad.vim:nnoremap <Leader>pF :Files<CR>
plugin/scratchpad.vim:nnoremap <Leader>pl :BLines<CR>
plugin/scratchpad.vim:nnoremap <Leader>pL :Lines<CR>
plugin/scratchpad.vim:nnoremap <Leader>pt :Tags<CR>
plugin/scratchpad.vim:nnoremap <Leader>pb :Buffers<CR>

plugin/plugs/floaterm.vim:nnoremap   <silent>   <leader>T   :FloatermNew<CR>
plugin/plugs/floaterm.vim:tnoremap   <silent>   <leader>T   <C-\><C-n>:FloatermNew<CR>
plugin/plugs/floaterm.vim:nnoremap   <silent>   <leader>tp   :FloatermPrev<CR>
plugin/plugs/floaterm.vim:tnoremap   <silent>   <leader>tp  <C-\><C-n>:FloatermPrev<CR>
plugin/plugs/floaterm.vim:nnoremap   <silent>   <leader>tn   :FloatermNext<CR>
plugin/plugs/floaterm.vim:tnoremap   <silent>   <leader>tn  <C-\><C-n>:FloatermNext<CR>
plugin/plugs/floaterm.vim:nnoremap   <silent>   <leader>tk   :FloatermKill<CR>
plugin/plugs/floaterm.vim:tnoremap   <silent>   <leader>tk  <C-\><C-n>:FloatermKill<CR>
plugin/plugs/floaterm.vim:nnoremap   <silent>   <leader>t   :FloatermToggle<CR>
plugin/plugs/floaterm.vim:tnoremap   <silent>   <leader>t  <C-\><C-n>:FloatermToggle<CR>
plugin/plugs/floaterm.vim:nnoremap   <leader>ts   :FloatermSend
plugin/plugs/floaterm.vim:vnoremap   <leader>ts   :FloatermSend
plugin/plugs/floaterm.vim:nnoremap   <silent>   <leader>tg   :FloatermNew lazygit<CR>
plugin/plugs/floaterm.vim:autocmd Filetype python nnoremap   <silent>   <leader>ty   :FloatermNew --name=repl --width=0.3 --wintype=normal --position=right python<CR>
plugin/plugs/floaterm.vim:autocmd Filetype python vnoremap   <silent>   <leader>tsy   :FloatermSend --name=repl<CR>


plugin/custom/shortcuts.vim:nnoremap <leader>cd :lcd %:p:h<CR>
plugin/custom/shortcuts.vim:noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
plugin/custom/shortcuts.vim:noremap <Leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

plugin/custom/shortcuts.vim:nnoremap <C-Space> <Esc>:noh<CR>
plugin/custom/shortcuts.vim:vnoremap <C-Space> <Esc>gV
plugin/custom/shortcuts.vim:onoremap <C-Space> <Esc>
plugin/custom/shortcuts.vim:cnoremap <C-Space> <C-c>
plugin/custom/shortcuts.vim:inoremap <C-Space> <Esc>
plugin/custom/shortcuts.vim:tnoremap <C-Space> <C-\><C-n>

plugin/custom/shortcuts.vim:" Movement remapping
plugin/custom/shortcuts.vim:noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
plugin/custom/shortcuts.vim:noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
plugin/custom/shortcuts.vim:" remap window switching keys 

plugin/custom/shortcuts.vim:noremap <Leader>h :<C-u>split<CR>
plugin/custom/shortcuts.vim:noremap <Leader>v :<C-u>vsplit<CR>
plugin/custom/shortcuts.vim:nnoremap <leader>o o<esc>
plugin/custom/shortcuts.vim:nnoremap <leader>O O<esc>
plugin/custom/shortcuts.vim:xnoremap < <gv
plugin/custom/shortcuts.vim:xnoremap > >gv
plugin/custom/shortcuts.vim:nnoremap > >>_
plugin/custom/shortcuts.vim:nnoremap < <<_
plugin/custom/shortcuts.vim:nnoremap <leader>K :m .-2<CR>==
plugin/custom/shortcuts.vim:nnoremap <leader>J :m .+1<CR>==
plugin/custom/shortcuts.vim:vnoremap K :m '<-2<CR>gv=gv
plugin/custom/shortcuts.vim:vnoremap J :m '>+1<CR>gv=gv
plugin/custom/shortcuts.vim:nmap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
plugin/custom/shortcuts.vim:nmap <leader><Enter> :w<CR>
plugin/custom/shortcuts.vim:imap <leader><Enter> <Esc>:w<CR>i
plugin/custom/shortcuts.vim:cmap w!! %!sudo tee > /dev/null %
plugin/custom/shortcuts.vim:nnoremap Q @q
plugin/custom/shortcuts.vim:nnoremap n nzzzv
plugin/custom/shortcuts.vim:nnoremap N Nzzzv

plugin/custom/shortcuts.vim:nmap <Leader>qw :w<CR><Esc>:call CustomExit()<CR>
plugin/custom/shortcuts.vim:nmap <Leader>qq  :call CustomExit()<CR>
plugin/custom/shortcuts.vim:nmap <Leader>qf <Esc>:call CustomExit()!<CR>
plugin/custom/shortcuts.vim:nnoremap <C-q> :call SmartClose()<cr>
plugin/custom/shortcuts.vim:inoremap <C-u> <esc>mzgUiw`za

plugin/plugs/emoji.vim:nmap <silent> <leader>em :%s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/g<CR>
