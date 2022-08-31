local key_opts_silent = {silent=true, noremap=true}

-- Run Current Buffer {{{
-- and saves file (lua or vim)
-- replaces 'complicated/unneeded' save_n_exec func
-- `:so` without file execute current buffer
vim.keymap.set('n', '<leader><leader>x', '<CMD>so<CR>', key_opts_silent)
vim.keymap.set('n', '<leader><leader>X', '<CMD>:w<bar>so<CR>', key_opts_silent)
-- }}}

-- Saving Settings {{{
-- faster saving
vim.api.nvim_set_keymap('n', '<leader><Enter>', ':w<CR>', key_opts_silent)
vim.api.nvim_set_keymap('i', '<leader><Enter>', '<Esc>:w<CR>i', key_opts_silent)

-- force writing RO file
-- very slow!!
vim.keymap.set('c', 'w!!', function () require'utils'.sudo_write() end, key_opts_silent)

-- " }}}

-- Copy/Paste Settings {{{
-- Copying/pasting text to the system clipboard.
vim.api.nvim_set_keymap('n', '<leader>p', '"+p', key_opts_silent)
vim.api.nvim_set_keymap('n', '<leader>y', '"+y', key_opts_silent)
vim.api.nvim_set_keymap('n', '<leader>y', 'V"+y', key_opts_silent)
vim.api.nvim_set_keymap('n', '<leader>Y', '"+y', key_opts_silent)

-- Yank to end of line
vim.api.nvim_set_keymap('n', 'Y', 'y$', key_opts_silent)

-- Prevent selecting and pasting from overwriting what you originally copied.
vim.api.nvim_set_keymap('x', 'p', 'pgvy', key_opts_silent)

-- Prevent x from overriding what's in the clipboard. {{{
-- https://github.com/nickjj/dotfiles/blob/master/.vimrc
vim.api.nvim_set_keymap('n', 'x', '"_x', key_opts_silent)
vim.api.nvim_set_keymap('n', 'X', '"_x', key_opts_silent)
-- }}}

-- }}}

-- Indent and Format Settings {{{
-- Better indenting
vim.api.nvim_set_keymap('x', '<', '<gv', key_opts_silent)
vim.api.nvim_set_keymap('x', '>', '>gv', key_opts_silent)
vim.api.nvim_set_keymap('n', '<', '<<_', key_opts_silent)
vim.api.nvim_set_keymap('n', '>', '>>_', key_opts_silent)

-- Move 1 more lines up or down in normal and visual selection modes.
vim.api.nvim_set_keymap('n', '<leader>K', '<CMD>m .-2<CR>==', key_opts_silent)
vim.api.nvim_set_keymap('n', '<leader>J', '<CMD>m .+1<CR>==', key_opts_silent)
vim.api.nvim_set_keymap('v', 'K', "<CMD>m '<-2<CR>gv=gv", key_opts_silent)
vim.api.nvim_set_keymap('v', 'J', "<CMD>m '>+1<CR>gv=gv", key_opts_silent)

-- remove trailing whitespace from lines
vim.api.nvim_set_keymap('n', '<leader>W', "<CMD>%s/\\s\\+$//<CR><CMD>let @/=''<CR>", key_opts_silent)
-- }}}

-- Add mapping for auto closing {{{
vim.api.nvim_set_keymap('i', '"<tab>', '""<Left>', key_opts_silent)
vim.api.nvim_set_keymap('i', "'<tab>", "''<Left>>", key_opts_silent)
vim.api.nvim_set_keymap('i', '(<tab>', '()<Left>', key_opts_silent)
vim.api.nvim_set_keymap('i', '[<tab>', '[]<Left>', key_opts_silent)
vim.api.nvim_set_keymap('i', '{<tab>', '{}<Left>', key_opts_silent)
vim.api.nvim_set_keymap('i', '{<CR>', '{<CR>}<ESC>O', key_opts_silent)
vim.api.nvim_set_keymap('i', '{;<CR>', '{<CR>};<ESC>O', key_opts_silent)
-- }}}

-- Escaping/Insert mode Settings {{{
-- Insert Mode Completion
-- <c-f> overwritten by fzf?
-- vim.api.nvim_set_keymap('i', '<c-f>', '<c-x><c-f>', key_opts_silent)

-- " Movement in insert mode
vim.api.nvim_set_keymap('i', '<C-h>', '<C-o>h', key_opts_silent)
vim.api.nvim_set_keymap('i', '<C-l>', '<C-o>a', key_opts_silent)
vim.api.nvim_set_keymap('i', '<C-j>', '<C-o>j', key_opts_silent)
vim.api.nvim_set_keymap('i', '<C-k>', '<C-o>k', key_opts_silent)

-- jk | Escaping!
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', key_opts_silent)

-- Use C-Space to Esc out of any mode
vim.api.nvim_set_keymap('n', '<C-Space>', '<Esc>:noh<CR>', key_opts_silent)
vim.api.nvim_set_keymap('v', '<C-Space>', '<Esc>gV', key_opts_silent)
vim.api.nvim_set_keymap('o', '<C-Space>', '<Esc>', key_opts_silent)
vim.api.nvim_set_keymap('c', '<C-Space>', '<C-c>', key_opts_silent)
vim.api.nvim_set_keymap('i', '<C-Space>', '<Esc>', key_opts_silent)
vim.api.nvim_set_keymap('t', '<C-Space>', '<C-\\><C-n>', key_opts_silent)

vim.api.nvim_set_keymap('t', '<leader><esc>', '<esc>', key_opts_silent)
-- }}}

-- Window Settings {{{
-- remap window switching keys
-- TODO: still needed/used?
vim.api.nvim_set_keymap('n', '<C-j>', '<C-W>j', key_opts_silent)
vim.api.nvim_set_keymap('n', '<C-k>', '<C-W>k', key_opts_silent)
vim.api.nvim_set_keymap('n', '<C-h>', '<C-W>h', key_opts_silent)
vim.api.nvim_set_keymap('n', '<C-l>', '<C-W>l', key_opts_silent)

-- Use alt + hjkl to resize windows
vim.api.nvim_set_keymap('n', '<M-j>', '<CMD>resize -2<CR>', key_opts_silent)
vim.api.nvim_set_keymap('n', '<M-k>', '<CMD>resize +2<CR>', key_opts_silent)
vim.api.nvim_set_keymap('n', '<M-h>', '<CMD>vertical resize -2<CR>', key_opts_silent)
vim.api.nvim_set_keymap('n', '<M-l>', '<CMD>vertical resize +2<CR>', key_opts_silent)

-- Split
vim.api.nvim_set_keymap('n', '<leader>h', ':<C-u>split<CR>', key_opts_silent)
vim.api.nvim_set_keymap('n', '<leader>v', ':<C-u>vsplit<CR>', key_opts_silent)

-- Close file but not buffer
vim.api.nvim_set_keymap('n', '<leader>d', '<CMD>b#<bar>bd#<CR>', key_opts_silent)

-- " switch tabs and buffers
vim.api.nvim_set_keymap('n', '<Tab>', '<CMD>bnext<CR>', key_opts_silent)
vim.api.nvim_set_keymap('n', '<S-Tab>', '<CMD>bprevious<CR>', key_opts_silent)
-- }}}

-- Movement Settings {{{
-- Movement remapping
vim.api.nvim_set_keymap('n', 'H', '^', key_opts_silent)
vim.api.nvim_set_keymap('n', 'L', '$', key_opts_silent)

-- remap movement up and down on wrapped files
-- count wraped lines as one line when doing relative jumps
vim.keymap.set('n', 'j', function() return vim.v.count == 0 and "gj" or "j" end, {expr = true})
vim.keymap.set('n', 'k', function() return vim.v.count == 0 and "gk" or "k" end, {expr = true})
-- }}}

-- Useful Misc Settings {{{

-- Set working directory {{{
vim.keymap.set('n', '<leader>cd', '<CMD>lcd %:p:h<CR>')
-- }}}

-- Set spelling {{{
vim.api.nvim_set_keymap('n', '<f6>', '<CMD>setlocal spell! spelllang=de_at<CR>', key_opts_silent)
vim.api.nvim_set_keymap('n', '<f7>', '<CMD>setlocal  spell! spelllang=en_us<CR>', key_opts_silent)
-- }}}

-- Change the current word in insertmode.{{{
-- Auto places you into the spot where you can start typing to change it.
vim.keymap.set('n', '<leader>rr', ':%s/<c-r><c-w>//g<left><left>')
vim.keymap.set('n', '<leader>rc', ':%s/<c-r><c-w>//gc<left><left><left>')
vim.keymap.set('v', '<C-r>', '"hy:%s/<C-r>h//gc<left><left><left>')
-- }}}

-- Search mappings: These will make it so that going to the next one in a
-- search will center on the line it's found in.
vim.api.nvim_set_keymap('n', 'n', 'nzzzv', key_opts_silent)
vim.api.nvim_set_keymap('n', 'N', 'Nzzzv', key_opts_silent)

-- Interesting input from repos {{{
-- https://github.com/joedbenjamin/nvim/blob/master/init.vim
vim.keymap.set('n', 'go', 'o<Esc>')
vim.keymap.set('n', 'gO', 'O<Esc>j')
vim.keymap.set('i', 'jj', '<Esc>A')
-- }}}

-- break points for undo {{{
vim.api.nvim_set_keymap('i', '.', '.<C-g>U', key_opts_silent)
vim.api.nvim_set_keymap('i', ',', ',<C-g>U', key_opts_silent)
vim.api.nvim_set_keymap('i', '(', '(<C-g>U', key_opts_silent)
vim.api.nvim_set_keymap('i', ')', ')<C-g>U', key_opts_silent)
vim.api.nvim_set_keymap('i', '!', '!<C-g>U', key_opts_silent)
vim.api.nvim_set_keymap('i', '?', '?<C-g>U', key_opts_silent)
-- }}}

-- }}}

-- short Plugin shortcuts {{{

-- Trouble shortcuts {{{
vim.api.nvim_set_keymap("n", "<leader>xx", "<CMD>Trouble<CR>", key_opts_silent)
vim.api.nvim_set_keymap("n", "<leader>xw", "<CMD>Trouble workspace_diagnostics<CR>", key_opts_silent)
vim.api.nvim_set_keymap("n", "<leader>xd", "<CMD>Trouble document_diagnostics<CR>", key_opts_silent)
vim.api.nvim_set_keymap("n", "<leader>xl", "<CMD>Trouble loclist<CR>", key_opts_silent)
vim.api.nvim_set_keymap("n", "<leader>xq", "<CMD>Trouble quickfix<CR>", key_opts_silent)
vim.api.nvim_set_keymap("n", "gR", "<CMD>Trouble lsp_references<CR>", key_opts_silent)
-- }}}

-- }}}
