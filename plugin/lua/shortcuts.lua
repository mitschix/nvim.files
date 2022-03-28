vim.g.mapleader = ','

local key_opts_silent = {silent=true, noremap=true}

-- break points for undo
vim.api.nvim_set_keymap('i', '.', '.<C-g>U', key_opts_silent)
vim.api.nvim_set_keymap('i', ',', ',<C-g>U', key_opts_silent)
vim.api.nvim_set_keymap('i', '(', '(<C-g>U', key_opts_silent)
vim.api.nvim_set_keymap('i', ')', ')<C-g>U', key_opts_silent)
vim.api.nvim_set_keymap('i', '!', '!<C-g>U', key_opts_silent)
vim.api.nvim_set_keymap('i', '?', '?<C-g>U', key_opts_silent)

-- Prevent x from overriding what's in the clipboard. {{{
-- https://github.com/nickjj/dotfiles/blob/master/.vimrc
vim.api.nvim_set_keymap('n', 'x', '"_x', key_opts_silent)
vim.api.nvim_set_keymap('n', 'X', '"_x', key_opts_silent)
-- }}}

-- " Change the current word in insertmode.{{{
-- "   Auto places you into the spot where you can start typing to change it.
local key_opts = {noremap=true}
vim.api.nvim_set_keymap('n', '<leader>rr', ':%s/<c-r><c-w>//g<left><left>', key_opts)
vim.api.nvim_set_keymap('n', '<leader>rc', ':%s/<c-r><c-w>//gc<left><left><left>', key_opts)
vim.api.nvim_set_keymap('v', '<C-r>', '"hy:%s/<C-r>h//gc<left><left><left>', key_opts)
-- }}}

-- https://github.com/joedbenjamin/nvim/blob/master/init.vim{{{
-- nnoremap go o<Esc>
-- nnoremap gO O<Esc>j
--
-- inoremap jj <Esc>A
vim.api.nvim_set_keymap('n', 'go', 'o<Esc>', key_opts)
vim.api.nvim_set_keymap('n', 'gO', 'O<Esc>j', key_opts)
vim.api.nvim_set_keymap('i', 'jj', '<Esc>A', key_opts)
-- }}}



-- short Plugin shortcuts {{{

-- Trouble shortcuts {{{
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>", key_opts_silent)
vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", key_opts_silent)
vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", key_opts_silent)
vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>", key_opts_silent)
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", key_opts_silent)
vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>", key_opts_silent)
-- }}}

-- }}}
