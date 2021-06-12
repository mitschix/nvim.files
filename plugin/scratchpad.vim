" https://github.com/tjdevries/config_manager/tree/master/xdg_config {{{
" Execute this file
function! s:save_and_exec() abort
  if &filetype == 'vim'
    :silent! write
    :source %
  elseif &filetype == 'lua'
    :silent! write
    :luafile %
  endif

  return
endfunction
nnoremap <leader><leader>x :call <SID>save_and_exec()<CR>

" Change the current word in insertmode.
"   Auto places you into the spot where you can start typing to change it.
nnoremap <leader>rr :%s/<c-r><c-w>//g<left><left><left>
nnoremap <leader>rc :%s/<c-r><c-w>//gc<left><left><left>
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" }}}

" Prevent x from overriding what's in the clipboard. {{{
" https://github.com/nickjj/dotfiles/blob/master/.vimrc
noremap x "_x
noremap X "_x

" }}}

" -----Code Generation----- {{{
" Guide navigation
noremap <leader><Tab> <Esc>/<++><Enter>"_c4l
inoremap <leader><Tab> <Esc>/<++><Enter>"_c4l
vnoremap <leader><Tab> <Esc>/<++><Enter>"_c4l

" general insert commands
inoremap ;g <++>

""" Abbreviations {{{
" remove whitespace after abbrev
" https://github.com/godlygeek/vim-files/blob/master/.vimrc
function! EatChar(pat)
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunc

iabbr _me mitschix (23629789+mitschix@users.noreply.github.com)<C-R>=EatChar('\s')<CR>
iabbr _t  <C-R>=strftime("%H:%M:%S")<CR><C-R>=EatChar('\s')<CR>
iabbr _d  <C-R>=strftime("%a, %d %b %Y")<CR><C-R>=EatChar('\s')<CR>
iabbr _dt <C-R>=strftime("%a, %d %b %Y %H:%M:%S %z")<CR><C-R>=EatChar('\s')<CR>
" }}}

" https://github.com/joedbenjamin/nvim/blob/master/init.vim{{{
nnoremap go o<Esc>
nnoremap gO O<Esc>j

inoremap jj <Esc>A

inoremap jn <Esc>o
inoremap <leader>dd <Esc>ddi
" fix to adjust curser position, might with mark
inoremap <leader>> <esc>>>a
inoremap <leader>< <esc><<a

set lazyredraw " screen will not redraw while executing macros
"}}}


" https://github.com/sheerun/vimrc{{{
" Keep 8 lines above or below the cursor when scrolling.

set scrolloff=8

" Keep 15 columns next to the cursor when scrolling horizontally.

set sidescroll=1
set sidescrolloff=15
" }}}


" fzf settings{{{
" https://github.com/uolot/dotfiles/blob/master/vim/files-fzf.vim
nnoremap <Leader>pf :GFiles<CR>
nnoremap <Leader>pF :Files<CR>
nnoremap <Leader>pl :BLines<CR>
nnoremap <Leader>pL :Lines<CR>
nnoremap <Leader>pt :Tags<CR>
nnoremap <Leader>pb :Buffers<CR>
"}}}
