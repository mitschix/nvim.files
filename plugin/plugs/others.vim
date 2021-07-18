

" === OTHER MISC PLUGIN SETTINGS ===


" == quickscope settings
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" == vim rainbow settings
let g:rainbow_active = 1

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
" nmap <silent> <C-_> <Plug>(pydocstring)

" toggle undotree
nmap <silent> <leader>u :UndotreeToggle<CR>

" configure ctrlsf
let g:ctrlsf_position = 'right'

" configure nvim-tree
let g:nvim_tree_auto_open = 1
let g:nvim_tree_auto_close = 1
let g:nvim_tree_auto_ignore_ft = 'startify'
let g:nvim_tree_add_trailing = 1
let g:nvim_tree_indent_markers = 1
" TODO might move to init.vim
hi def NvimTreeRootFolder guifg=x
let g:nvim_tree_root_folder_modifier = ':h'

