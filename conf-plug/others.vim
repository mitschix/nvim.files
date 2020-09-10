

" === OTHER MISC PLUGIN SETTINGS ===


" == quickscope settings
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" == vim rainbow settings
let g:rainbow_active = 1


" == vimwiki settings
let g:vimwiki_list = [{'path': '~/docs/vimwiki',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
" disable global vimwiki filetype for .md
let g:vimwiki_global_ext = 0

" == plugin shortcuts

" Fzf easy commands
nmap <C-b> :Buffers<cr>
nmap <C-f> :Files<cr>
inoremap <expr> <c-f> fzf#vim#complete#path('rg --files')

" call nnn picker
map <silent> <f2> :NnnPicker '%:p:h'<CR>
" toggle tagbar
map <silent> <f4> :Tagbar<CR>
