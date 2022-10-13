-- GitSigns color config {{{
-- TODO highlight currently not in vim.api
-- augroup -> fix to change hi even if theme uses `highlight clear`
vim.cmd([[
  augroup custom_theme_highlights
    autocmd!
    au ColorScheme * hi GitSignsAdd ctermfg=green guifg=#A3BE8C
    au ColorScheme * hi GitSignsChange ctermfg=yellow guifg=#E0C387
    au ColorScheme * hi GitSignsDelete ctermfg=red guifg=#BF616A
  augroup END
]])
-- }}}

require('gitsigns').setup{signs={add={text='+'},change={text='~'}}}

local key_opts = {silent=true}
vim.keymap.set('n', '<leader>gb', ':Gitsigns toggle_current_line_blame<CR>', key_opts)
vim.keymap.set('n', '<leader>gd', ':Gitsigns preview_hunk<CR>', key_opts)
vim.keymap.set('n', '<leader>gr', ':Gitsigns reset_hunk<CR>', key_opts)
vim.keymap.set('n', '<leader>gn', ':Gitsigns next_hunk<CR>', key_opts)
vim.keymap.set('n', '<leader>gp', ':Gitsigns prev_hunk<CR>', key_opts)
vim.keymap.set('n', '<leader>gs', ':Gitsigns stage_hunk<CR>', key_opts)
vim.keymap.set('n', '<leader>gu', ':Gitsigns undo_stage_hunk<CR>', key_opts)
vim.keymap.set('n', '<leader>gg', ':LazyGit<CR>', key_opts)
