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
plugin/custom/shortcuts.vim:" Search mappings: These will make it so that going to the next one in a
plugin/custom/shortcuts.vim:nnoremap n nzzzv
plugin/custom/shortcuts.vim:nnoremap N Nzzzv

plugin/custom/shortcuts.vim:nmap <Leader>qw :w<CR><Esc>:call CustomExit()<CR>
plugin/custom/shortcuts.vim:nmap <Leader>qq  :call CustomExit()<CR>
plugin/custom/shortcuts.vim:nmap <Leader>qf <Esc>:call CustomExit()!<CR>
plugin/custom/shortcuts.vim:nnoremap <C-q> :call SmartClose()<cr>
plugin/custom/shortcuts.vim:inoremap <C-u> <esc>mzgUiw`za

plugin/plugs/emoji.vim:nmap <silent> <leader>em :%s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/g<CR>
