
-- source plugin configs
require('plugins/compe')
require('plugins/nvimtree')

-- setup and configure minor plugins
-- treesitter config
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true
  },
  rainbow = {enable = true}
}

-- configure nvim-tree
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

require('gitsigns').setup{
    signs={add={text='+'},change={text='~'}},
    status_formatter = GitSignsPadding}

-- plugin mappings
local key_opts = {silent=true, noremap=true}

vim.api.nvim_set_keymap('n', '<F2>', ':NvimTreeToggle<CR>', key_opts)
vim.api.nvim_set_keymap('', '<f4>', ':Tagbar<CR>', key_opts)
vim.api.nvim_set_keymap('n', '<leader>u', ':UndotreeToggle<CR>', key_opts)

-- plugin settings

