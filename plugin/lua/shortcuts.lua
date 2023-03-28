local key_opts_silent = {silent=true}

-- Run Current Buffer {{{
-- and saves file (lua or vim)
-- replaces 'complicated/unneeded' save_n_exec func
-- `:so` without file execute current buffer
vim.keymap.set('n', '<leader><leader>x', '<CMD>so<CR>')
vim.keymap.set('n', '<leader><leader>X', '<CMD>:w<bar>so<CR>')
-- }}}

-- Saving Settings {{{
-- faster saving
vim.keymap.set('n', '<leader><Enter>', ':w<CR>')
vim.keymap.set('i', '<leader><Enter>', '<Esc>:w<CR>i')

-- force writing RO file
-- very slow!!
vim.keymap.set('c', 'w!!', function () require'utils'.sudo_write() end)

-- " }}}

-- Copy/Paste Settings {{{
-- Copying/pasting text to the system clipboard.
vim.keymap.set('n', '<leader>p', '"+p')
vim.keymap.set({'n','v'}, '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', 'V"+y')

-- Yank to end of line
vim.keymap.set('n', 'Y', 'y$')

-- Prevent selecting and pasting from overwriting what you originally copied.
vim.keymap.set('x', 'p', 'pgvy')

-- Prevent x from overriding what's in the clipboard. {{{
-- https://github.com/nickjj/dotfiles/blob/master/.vimrc
vim.keymap.set('n', 'x', '"_x')
vim.keymap.set('n', 'X', '"_x')
-- }}}

-- }}}

-- Indent and Format Settings {{{
-- Better indenting
vim.keymap.set('x', '<', '<gv')
vim.keymap.set('x', '>', '>gv')
vim.keymap.set('n', '<', '<<_')
vim.keymap.set('n', '>', '>>_')

-- Move 1 more lines up or down in normal and visual selection modes.
vim.keymap.set('n', '<leader>K', '<CMD>m .-2<CR>==')
vim.keymap.set('n', '<leader>J', '<CMD>m .+1<CR>==')
vim.keymap.set('v', 'K', "<CMD>m '<-2<CR>gv=gv")
vim.keymap.set('v', 'J', "<CMD>m '>+1<CR>gv=gv")

-- remove trailing whitespace from lines
vim.keymap.set('n', '<leader>W', "<CMD>%s/\\s\\+$//<CR><CMD>let @/=''<CR>")
-- }}}

-- Add mapping for auto closing {{{
vim.keymap.set('i', '"<tab>', '""<Left>')
vim.keymap.set('i', "'<tab>", "''<Left>")
vim.keymap.set('i', '(<tab>', '()<Left>')
vim.keymap.set('i', '[<tab>', '[]<Left>')
vim.keymap.set('i', '{<tab>', '{}<Left>')
vim.keymap.set('i', '{<CR>', '{<CR>}<ESC>O')
vim.keymap.set('i', '{;<CR>', '{<CR>};<ESC>O')
-- }}}

-- Escaping/Insert mode Settings {{{
-- " Movement in insert mode
vim.keymap.set('i', '<C-h>', '<C-o>h')
vim.keymap.set('i', '<C-l>', '<C-o>a')
vim.keymap.set('i', '<C-j>', '<C-o>j')
vim.keymap.set('i', '<C-k>', '<C-o>k')

-- jk | Escaping!
vim.keymap.set('i', 'jk', '<ESC>')

-- Use C-Space to Esc out of any mode
vim.keymap.set('n', '<C-Space>', '<Esc>:noh<CR>')
vim.keymap.set('v', '<C-Space>', '<Esc>gV')
vim.keymap.set('o', '<C-Space>', '<Esc>')
vim.keymap.set('c', '<C-Space>', '<C-c>')
vim.keymap.set('i', '<C-Space>', '<Esc>')
vim.keymap.set('t', '<C-Space>', '<C-\\><C-n>')

vim.keymap.set('t', '<leader><esc>', '<esc>')
-- }}}

-- Window Settings {{{
-- remap window switching keys
-- TODO: still needed/used?
vim.keymap.set('n', '<C-j>', '<C-W>j')
vim.keymap.set('n', '<C-k>', '<C-W>k')
vim.keymap.set('n', '<C-h>', '<C-W>h')
vim.keymap.set('n', '<C-l>', '<C-W>l')

-- Use alt + hjkl to resize windows
vim.keymap.set('n', '<M-j>', '<CMD>resize -2<CR>')
vim.keymap.set('n', '<M-k>', '<CMD>resize +2<CR>')
vim.keymap.set('n', '<M-h>', '<CMD>vertical resize -2<CR>')
vim.keymap.set('n', '<M-l>', '<CMD>vertical resize +2<CR>')

-- Split
vim.keymap.set('n', '<leader>h', ':<C-u>split<CR>')
vim.keymap.set('n', '<leader>v', ':<C-u>vsplit<CR>')

-- Close file but not buffer
vim.keymap.set('n', '<leader>d', '<CMD>b#<bar>bd#<CR>')

-- " switch tabs and buffers
vim.keymap.set('n', '<Tab>', '<CMD>bnext<CR>')
vim.keymap.set('n', '<S-Tab>', '<CMD>bprevious<CR>')
-- }}}

-- Movement Settings {{{
-- Movement remapping
vim.keymap.set('n', 'H', '^')
vim.keymap.set('n', 'L', '$')

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
vim.keymap.set('n', '<f6>', '<CMD>setlocal spell! spelllang=de_at<CR>', key_opts_silent)
vim.keymap.set('n', '<f7>', '<CMD>setlocal  spell! spelllang=en_us<CR>', key_opts_silent)
-- }}}

-- Change the current word in insertmode.{{{
-- Auto places you into the spot where you can start typing to change it.
vim.keymap.set('n', '<leader>rr', ':%s/<c-r><c-w>//g<left><left>')
vim.keymap.set('n', '<leader>rc', ':%s/<c-r><c-w>//gc<left><left><left>')
vim.keymap.set('v', '<C-r>', '"hy:%s/<C-r>h//gc<left><left><left>')
-- }}}

-- Search mappings: These will make it so that going to the next one in a
-- search will center on the line it's found in.
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')

-- Interesting input from repos {{{
-- https://github.com/joedbenjamin/nvim/blob/master/init.vim
vim.keymap.set('n', 'go', 'o<Esc>')
vim.keymap.set('n', 'gO', 'O<Esc>j')
vim.keymap.set('i', 'jj', '<Esc>A')
-- }}}

-- break points for undo {{{
vim.keymap.set('i', '.', '.<C-g>U')
vim.keymap.set('i', ',', ',<C-g>U')
vim.keymap.set('i', '(', '(<C-g>U')
vim.keymap.set('i', ')', ')<C-g>U')
vim.keymap.set('i', '!', '!<C-g>U')
vim.keymap.set('i', '?', '?<C-g>U')
-- }}}

-- }}}
