vim.g.mapleader = ','

local key_opts = {silent=true, noremap=true}

-- break points for undo
vim.api.nvim_set_keymap('i', '.', '.<C-g>U', key_opts)
vim.api.nvim_set_keymap('i', ',', ',<C-g>U', key_opts)
vim.api.nvim_set_keymap('i', '(', '(<C-g>U', key_opts)
vim.api.nvim_set_keymap('i', ')', ')<C-g>U', key_opts)
vim.api.nvim_set_keymap('i', '!', '!<C-g>U', key_opts)
vim.api.nvim_set_keymap('i', '?', '?<C-g>U', key_opts)

-- Prevent x from overriding what's in the clipboard. {{{
-- https://github.com/nickjj/dotfiles/blob/master/.vimrc
vim.api.nvim_set_keymap('n', 'x', '"_x', key_opts)
vim.api.nvim_set_keymap('n', 'X', '"_x', key_opts)
-- }}}
