-- " settings for floaterm
vim.g.floaterm_autoclose = 1

local key_opts = {silent=true, noremap=true}
-- " setup shortcuts to handle floaterm mostly '<leader>t'
vim.api.nvim_set_keymap('n','<Leader>T',':FloatermNew<CR>', key_opts)
vim.api.nvim_set_keymap('t','<Leader>T','<C-n>:FloatermNew<CR>', key_opts)
vim.api.nvim_set_keymap('n','<Leader>tp',':FloatermPrev<CR>', key_opts)
vim.api.nvim_set_keymap('t','<Leader>tp','<C-n>:FloatermPrev<CR>', key_opts)
vim.api.nvim_set_keymap('n','<Leader>tn',':FloatermNext<CR>', key_opts)
vim.api.nvim_set_keymap('t','<Leader>tn','<C-n>:FloatermNext<CR>', key_opts)
vim.api.nvim_set_keymap('n','<Leader>tk',':FloatermKill<CR>', key_opts)
vim.api.nvim_set_keymap('t','<Leader>tk','<C-n>:FloatermKill<CR>', key_opts)
vim.api.nvim_set_keymap('n','<Leader>t',':FloatermToggle<CR>', key_opts)
vim.api.nvim_set_keymap('t','<Leader>t','<C-n>:FloatermToggle<CR>', key_opts)


vim.api.nvim_set_keymap('n','<leader>ts',':FloatermSend', key_opts)
vim.api.nvim_set_keymap('v','<leader>ts',':FloatermSend', key_opts)

-- " shortcuts to use floaterm with cmd tools
vim.api.nvim_set_keymap('n','<leader>tg',':FloatermNew lazygit<CR>', key_opts)

-- " create python repl
vim.api.nvim_set_keymap('n','<leader>ty',':FloatermNew --name=repl --width=0.3 --wintype=normal --position=right python<CR>', key_opts)
vim.api.nvim_set_keymap('v','<leader>tsy',':FloatermSend --name=repl<cr>', key_opts)
