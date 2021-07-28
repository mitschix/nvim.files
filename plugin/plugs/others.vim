

" === OTHER MISC PLUGIN SETTINGS ===


" == indentline settings
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1

" == plugin shortcuts

" toggle tagbar
map <silent> <f4> :Tagbar<CR>

" toggle undotree
nmap <silent> <leader>u :UndotreeToggle<CR>

" configure nvim-tree
let g:nvim_tree_auto_open = 1
let g:nvim_tree_auto_close = 1
let g:nvim_tree_auto_ignore_ft = 'startify'
let g:nvim_tree_add_trailing = 1
let g:nvim_tree_indent_markers = 1
" TODO might move to init.vim
hi def NvimTreeRootFolder guifg=x
let g:nvim_tree_root_folder_modifier = ':h'

