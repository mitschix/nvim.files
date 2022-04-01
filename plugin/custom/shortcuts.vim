

" === SHORTCUTS ===


" remap leader
let mapleader = ","


" Nvim config/Opening Settings {{{
" edit nvim config
nmap <silent> <leader>sv :so $MYVIMRC<CR>
nmap <silent> <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

"" Set working directory
nnoremap <leader>cd :lcd %:p:h<CR>
"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>
" }}}

" Copy/Paste Settings {{{
" Copying/pasting text to the system clipboard.
noremap  <leader>p "+p
vnoremap <leader>y "+y
nnoremap <leader>y V"+y
nnoremap <leader>Y "+y

" Yank to end of line
nnoremap Y y$

" Prevent selecting and pasting from overwriting what you originally copied.
xnoremap p pgvy
"}}}

" Escaping/Insert mode Settings {{{
" Insert Mode Completion 
imap <c-f> <c-x><c-f>
imap <c-]> <c-x><c-]>
imap <c-l> <c-x><c-l>

" Movement in insert mode
inoremap <C-h> <C-o>h
inoremap <C-l> <C-o>a
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k

" add mapping for auto closing
imap "<tab> ""<Left>
imap '<tab> ''<Left>
imap (<tab> ()<Left>
imap [<tab> []<Left>
imap {<tab> {}<Left>
imap {<CR> {<CR>}<ESC>O
imap {;<CR> {<CR>};<ESC>O

if has('nvim')
    tmap <Esc> <C-\><C-n>
    tmap <leader><esc> <esc>
endif

" jk | Escaping!
inoremap jk <Esc>
inoremap jj <Esc>
" xnoremap jk <Esc>
" cnoremap jk <C-c>

" Use C-Space to Esc out of any mode
nnoremap <C-Space> <Esc>:noh<CR>
vnoremap <C-Space> <Esc>gV
onoremap <C-Space> <Esc>
cnoremap <C-Space> <C-c>
inoremap <C-Space> <Esc>
tnoremap <C-Space> <C-\><C-n>

" }}}

" Movement Settings {{{
" Movement remapping
nmap H ^
nmap L $

" remap movement up and down on wrapped files
" count wraped lines as one line when doing relative jumps
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" }}}

" Window Settings {{{
" remap window switching keys 
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Use alt + hjkl to resize windows
nnoremap <silent> <M-j>    :resize -2<CR>
nnoremap <silent> <M-k>    :resize +2<CR>
nnoremap <silent> <M-h>    :vertical resize -2<CR>
nnoremap <silent> <M-l>    :vertical resize +2<CR>

" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

" Close file but not buffer
nmap ,d :b#<bar>bd#<CR>

" switch tabs and buffers
map <silent> <C-Tab> :tabnext<Enter>
nmap <silent> <S-Tab> :bprevious<Enter>
nmap <silent> <Tab> :bnext<Enter>
" }}}

" Indent and Format Settings {{{
" Open new line below and above current line
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>

" Better indenting
xnoremap < <gv
xnoremap > >gv
nnoremap > >>_
nnoremap < <<_

" Move 1 more lines up or down in normal and visual selection modes.
nnoremap <leader>K :m .-2<CR>==
nnoremap <leader>J :m .+1<CR>==
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv
" remove trailing whitespace from lines
nmap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
" }}}

" Useful Misc Settings {{{

" Saving Settings {{{
" faster saving 
nmap <leader><Enter> :w<CR>
imap <leader><Enter> <Esc>:w<CR>i

" force writing RO file
cmap w!! %!sudo tee > /dev/null %
" }}}

" qq to record, Q to replay
nnoremap Q @q

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv
" }}}

" Functions Settings {{{
set pastetoggle=<F5>
map <f6> :setlocal spell! spelllang=de_at<CR>
map <f7> :setlocal spell! spelllang=en_us<CR>

" self defined functions.vim {{{
" custom exit und closing
nmap <Leader>qw :w<CR><Esc>:call CustomExit()<CR>
nmap <Leader>qq  :call CustomExit()<CR>
nmap <Leader>qf <Esc>:call CustomExit()!<CR>

" toggle wordcount functions
nnoremap <leader>wc :call WordCount()<CR>
nnoremap <leader>wu :call WordCount('update')<CR>

nnoremap <leader><leader>x :call <SID>save_and_exec()<CR>

" map change settings with function {{{
call Map_change_option('p', 'paste')
call Map_change_option('l', 'list')
call Map_change_option('n', 'number')
call Map_change_option('w', 'wrap')
call Map_change_option('h', 'hlsearch')
call Map_change_option('m', 'mouse', 'let &mouse = &mouse == "" ? "a" : ""')
call Map_change_option('t', 'textwidth', 'let &textwidth = input("textwidth (". &textwidth ."): ")<bar>redraw')
call Map_change_option('b', 'background', 'let &background = &background == "dark" ? "light" : "dark"<bar>redraw')
" }}}
" }}}
" }}}
