
-- source plugin configs
require('plugins.packer')
require('plugins.cmp')
require('plugins.nvimtree')
require('plugins.git')
require('plugins.dap')
require('plugins.floatterm')
require("luasnip.loaders.from_vscode").load()

-- setup and configure minor plugins
-- treesitter config
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true
  },
  rainbow = {enable = true}
}

-- plugin mappings
local key_opts = {silent=true, noremap=true}

vim.api.nvim_set_keymap('n', '<F2>', ':NvimTreeToggle<CR>', key_opts)
vim.api.nvim_set_keymap('', '<f4>', ':Tagbar<CR>', key_opts)
vim.api.nvim_set_keymap('n', '<leader>u', ':UndotreeToggle<CR>', key_opts)

-- plugin settings
vim.g.spacevim_todo_labels = {'FIXME','NOTE','TODO','QUESTION'}
vim.g.spacevim_todo_labels_pattern = '\vTODO:?|FIXME:?|NOTE:?'

vim.g.sonokai_transparent_background = 1

-- disable extra whitespace for alpha startup screen
vim.cmd('autocmd FileType alpha highlight ExtraWhitespace NONE')
