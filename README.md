# nvim.files
Outsourced dotfiles repository for nvim + plug.vim. Fully automated setup.


## Custom keymappings 
used <leader> is ","

| Mapping | Command | Mode | Description |
|---------|---------|------|-------------|

| nmap <silent> <<leader>>sv :so $MYVIMRC<<CR>>
| nmap <silent> <<leader>>ev <C-w><C-v><C-l>:e $MYVIMRC<<CR>>
| map <silent> <C-Tab> :tabnext<Enter>
| nmap <silent> <S-Tab> :bNext<Enter>
| nmap <silent> <Tab> :bnext<Enter>
| cmap w!! %!sudo tee > /dev/null %
| noremap  <<leader>>p "+p
| vnoremap <<leader>>y "+y
| nnoremap <<leader>>y V"+y
| nnoremap <<leader>>Y "+y
| nnoremap Y y$
| xnoremap p pgvy
| imap <c-f> <c-x><c-f>
| imap <c-]> <c-x><c-]>
| imap <c-l> <c-x><c-l>
| nmap H ^
| nmap L $
| nnoremap j gj
| nnoremap k gk
| nnoremap gj j
| nnoremap gk k
| inoremap jk <Esc>
| xnoremap jk <Esc>
| cnoremap jk <C-c>
| map <silent> <f3> :call ToggleNetrw()<<CR>>
| map <f6> :setlocal spell! spelllang=de_at<<CR>>
| map <f7> :setlocal spell! spelllang=en_us<<CR>>
| map <<leader>><Enter> o<esc>
| nnoremap <<leader>>o o<esc>
| nnoremap <<leader>>O O<esc>
| map <C-j> <C-W>j
| map <C-k> <C-W>k
| map <C-h> <C-W>h
| map <C-l> <C-W>l
| inoremap <C-h> <C-o>h
| inoremap <C-l> <C-o>a
| inoremap <C-j> <C-o>j
| inoremap <C-k> <C-o>k
| nnoremap <Up> :resize +2<<CR>>
| nnoremap <Down> :resize -2<<CR>>
| nnoremap <Left> :vertical resize +2<<CR>>
| nnoremap <Right> :vertical resize -2<<CR>>
| map <silent> <<leader>>L :set list!<<CR>>
| inoremap <<leader>>D <C-r>=strftime('%F')<<CR>>
| nnoremap <<leader>>D i<C-r>=strftime('%F')<<CR>><Esc>
| inoremap <<leader>>i <C-r>=system('cat ~/.docstring')<<CR>>
| nnoremap <<leader>>i i<C-r>=system('cat ~/.docstring')<<CR>><Esc>
| nnoremap <<leader>>wc :call WordCount()<<CR>>
| nnoremap <<leader>>wu :call WordCount('update')<<CR>>
| imap "<tab> ""<Left>
| imap '<tab> ''<Left>
| imap (<tab> ()<Left>
| imap [<tab> []<Left>
| imap {<tab> {}<Left>
| imap {<<CR>> {<<CR>>}<ESC>O
| imap {;<<CR>> {<<CR>>};<ESC>O
| nmap <<leader>>W :%s/\s\+$//<<CR>>:let @/=''<<CR>>
| nmap <C-b> :Buffers<<CR>>
| nmap <C-f> :Files<<CR>>
|
| call s:map_change_option('n', 'number')
| call s:map_change_option('w', 'wrap')
| call s:map_change_option('g', 'Goyo')
| call s:map_change_option('h', 'hlsearch')
| call s:map_change_option('m', 'mouse', 'let &mouse = &mouse == "" ? "a" : ""')
| call s:map_change_option('t', 'textwidth', 'let &textwidth = input("textwidth (". &textwidth ."): ")<bar>redraw')
| call s:map_change_option('b', 'background', 'let &background = &background == "dark" ? "light" : "dark"<bar>redraw')
