

" === SHORTCUTS ===


" remap leader
let mapleader = ","

" edit nvim config
nmap <silent> <leader>sv :so $MYVIMRC<CR>
nmap <silent> <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nmap <leader><Enter> :w<CR>
imap <leader><Enter> <Esc>:w<CR>i

if has('nvim')
    tmap <Esc> <C-\><C-n>
    tmap <leader><esc> <esc>
endif

" switch tabs and buffers
map <silent> <C-Tab> :tabnext<Enter>
nmap <silent> <S-Tab> :bNext<Enter>
nmap <silent> <Tab> :bnext<Enter>

" force writing RO file
cmap w!! %!sudo tee > /dev/null %

" qq to record, Q to replay
nnoremap Q @q

" Copying/pasting text to the system clipboard.
noremap  <leader>p "+p
vnoremap <leader>y "+y
nnoremap <leader>y V"+y
nnoremap <leader>Y "+y

" Yank to end of line
nnoremap Y y$

" Prevent selecting and pasting from overwriting what you originally copied.
xnoremap p pgvy

" Insert Mode Completion {{{
imap <c-f> <c-x><c-f>
imap <c-]> <c-x><c-]>
imap <c-l> <c-x><c-l>
" }}}

" Movement remapping {{{
nmap H ^
nmap L $

" remap movement up and down on wrapped files
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
" }}}

" jk | Escaping!
inoremap jk <Esc>
" xnoremap jk <Esc>
" cnoremap jk <C-c>

set pastetoggle=<F5>
map <f6> :setlocal spell! spelllang=de_at<CR>
map <f7> :setlocal spell! spelllang=en_us<CR>

" Open new line below and above current line
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>

" remap motion keys
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

" Movement in insert mode
inoremap <C-h> <C-o>h
inoremap <C-l> <C-o>a
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k

" remap arrow keys to use hjkl
" nnoremap <Up> :resize +2<CR>
" nnoremap <Down> :resize -2<CR>
" nnoremap <Left> :vertical resize +2<CR>
" nnoremap <Right> :vertical resize -2<CR>

" Better indenting
xnoremap < <gv
xnoremap > >gv
nnoremap > >>_
nnoremap < <<_

" Move 1 more lines up or down in normal and visual selection modes.
nnoremap K :m .-2<CR>==
nnoremap J :m .+1<CR>==
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Use alt + hjkl to resize windows
nnoremap <silent> <M-j>    :resize -2<CR>
nnoremap <silent> <M-k>    :resize +2<CR>
nnoremap <silent> <M-h>    :vertical resize -2<CR>
nnoremap <silent> <M-l>    :vertical resize +2<CR>


" insert date
inoremap <leader>D <C-r>=strftime('%F')<CR>
nnoremap <leader>D i<C-r>=strftime('%F')<CR><Esc>

" toggle wordcount functions
nnoremap <leader>wc :call WordCount()<CR>
nnoremap <leader>wu :call WordCount('update')<CR>

" add mapping for auto closing
imap "<tab> ""<Left>
imap '<tab> ''<Left>
imap (<tab> ()<Left>
imap [<tab> []<Left>
imap {<tab> {}<Left>
imap {<CR> {<CR>}<ESC>O
imap {;<CR> {<CR>};<ESC>O

" remove trailing whitespace from lines
nmap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>
"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>


" call functions from functsion.vim
nmap <Leader>qw :w<CR><Esc>:call CustomExit()<CR>
nmap <Leader>qq  :call CustomExit()<CR>
nmap <Leader>qf <Esc>:call CustomExit()!<CR>
nnoremap <C-q> :call SmartClose()<cr>

call Map_change_option('p', 'paste')
call Map_change_option('l', 'list')
call Map_change_option('n', 'number')
call Map_change_option('w', 'wrap')
call Map_change_option('h', 'hlsearch')
call Map_change_option('m', 'mouse', 'let &mouse = &mouse == "" ? "a" : ""')
call Map_change_option('t', 'textwidth', 'let &textwidth = input("textwidth (". &textwidth ."): ")<bar>redraw')
call Map_change_option('b', 'background', 'let &background = &background == "dark" ? "light" : "dark"<bar>redraw')
" !! plugin goyo needed
call Map_change_option('g', 'Goyo')


" == other magic shortcuts

" from stevelosh:
" "Uppercase word" mapping.
"
" This mapping allows you to press <c-u> in insert mode to convert the current
" word to uppercase.  It's handy when you're writing names of constants and
" don't want to use Capslock.
"
" To use it you type the name of the constant in lowercase.  While your
" cursor is at the end of the word, press <c-u> to uppercase it, and then
" continue happily on your way:
"
"                            cursor
"                            v
"     max_connections_allowed|
"     <c-u>
"     MAX_CONNECTIONS_ALLOWED|
"                            ^
"                            cursor
"
" It works by exiting out of insert mode, recording the current cursor location
" in the z mark, using gUiw to uppercase inside the current word, moving back to
" the z mark, and entering insert mode again.
"
" Note that this will overwrite the contents of the z mark.  I never use it, but
" if you do you'll probably want to use another mark.
inoremap <C-u> <esc>mzgUiw`za


