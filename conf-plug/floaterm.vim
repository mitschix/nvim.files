" settings for floaterm
" if using with neovim - pip install neovim-remote

let g:floaterm_autoclose = 1

" setup shortcuts to handle floaterm mostly '<leader>t'
nnoremap   <silent>   <leader>T   :FloatermNew<CR>
tnoremap   <silent>   <leader>T   <C-\><C-n>:FloatermNew<CR>
nnoremap   <silent>   <leader>tp   :FloatermPrev<CR>
tnoremap   <silent>   <leader>tp  <C-\><C-n>:FloatermPrev<CR>
nnoremap   <silent>   <leader>tn   :FloatermNext<CR>
tnoremap   <silent>   <leader>tn  <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <leader>tk   :FloatermKill<CR>
tnoremap   <silent>   <leader>tk  <C-\><C-n>:FloatermKill<CR>
nnoremap   <silent>   <leader>t   :FloatermToggle<CR>
tnoremap   <silent>   <leader>t  <C-\><C-n>:FloatermToggle<CR>

nnoremap   <leader>ts   :FloatermSend
vnoremap   <leader>ts   :FloatermSend


" shortcuts to use floaterm with cmd tools
nnoremap   <silent>   <leader>tg   :FloatermNew lazygit<CR>
" create python repl
autocmd Filetype python nnoremap   <silent>   <leader>ty   :FloatermNew --name=repl --width=0.3 --wintype=normal --position=right python<CR>
autocmd Filetype python vnoremap   <silent>   <leader>tsy   :FloatermSend --name=repl<CR>
