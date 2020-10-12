

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

" == indentline settings
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1

" == plugin shortcuts

" toggle tagbar
map <silent> <f4> :Tagbar<CR>
let g:tagbar_autofocus = 1

" remove pydocstring mappings
nmap <silent> <C-_> <Plug>(pydocstring)
