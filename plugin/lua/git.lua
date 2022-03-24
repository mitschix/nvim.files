
function GitSignsPadding(status)
          local added, changed, removed = status.added, status.changed, status.removed
          local status_txt = {}
          if added   and added   > 0 then table.insert(status_txt, '+'..added  ) end
          if changed and changed > 0 then table.insert(status_txt, '~'..changed) end
          if removed and removed > 0 then table.insert(status_txt, '-'..removed) end
          -- add padding at start and end
          if next(status_txt) ~= nil then
              table.insert(status_txt, 1, ' ')
              table.insert(status_txt, ' ')
          end
          return table.concat(status_txt, ' ')
end

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

require('gitsigns').setup{
    signs={add={text='+'},change={text='~'}},
    status_formatter = GitSignsPadding}

local key_opts = {silent=true, noremap=true}
vim.api.nvim_set_keymap('n', '<leader>gb', ':Gitsigns toggle_current_line_blame<CR>', key_opts)
vim.api.nvim_set_keymap('n', '<leader>gd', ':Gitsigns preview_hunk<CR>', key_opts)
vim.api.nvim_set_keymap('n', '<leader>gn', ':Gitsigns next_hunk<CR>', key_opts)
vim.api.nvim_set_keymap('n', '<leader>gp', ':Gitsigns prev_hunk<CR>', key_opts)
vim.api.nvim_set_keymap('n', '<leader>gs', ':Gitsigns stage_hunk<CR>', key_opts)
vim.api.nvim_set_keymap('n', '<leader>gu', ':Gitsigns undo_stage_hunk<CR>', key_opts)
