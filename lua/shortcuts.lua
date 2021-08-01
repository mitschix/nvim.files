vim.g.mapleader = ','

local key_opts = {silent=true, noremap=true}

-- break points for undo
vim.api.nvim_set_keymap('i', '.', '.<C-g>U', key_opts)
vim.api.nvim_set_keymap('i', ',', ',<C-g>U', key_opts)
vim.api.nvim_set_keymap('i', '(', '(<C-g>U', key_opts)
vim.api.nvim_set_keymap('i', ')', ')<C-g>U', key_opts)
vim.api.nvim_set_keymap('i', '!', '!<C-g>U', key_opts)
vim.api.nvim_set_keymap('i', '?', '?<C-g>U', key_opts)
