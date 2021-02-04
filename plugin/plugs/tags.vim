

" === (GUTEN)TAGS PLUGIN SETTINGS ===


" vim gutentags settings
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['requirements.txt', '.git']
let g:gutentags_cache_dir = '~/.config/nvim/tags'
let g:gutentags_ctags_extra_args = [
      \ '--tag-relative=yes',
      \ '--fields=+ailmnS',
      \ ]

