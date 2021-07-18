require('nvim_comment').setup()
require('colorizer').setup()
require('true-zen').setup()

-- setup completion menu
vim.cmd("set shortmess+=c")
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    spell = true;
    treesitter = true;
    ultisnips = true;
    emoji = true;
    tags = false;
    vsnip = false;
    snippets_nvim = false;
  };
}

-- treesitter config
-- require'nvim-treesitter.configs'.setup {
--   ensure_installed = "maintained",
--   highlight = {
--     enable = true
--   },
-- }

local tree_cb = require'nvim-tree.config'.nvim_tree_callback

-- configure nvim-tree
vim.api.nvim_set_keymap('n', '<F2>', ':NvimTreeToggle<CR>', {silent=true, noremap=true})
vim.g.nvim_tree_auto_open = 1
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_auto_ignore_ft = {'startify'}
vim.g.nvim_tree_add_trailing = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_show_icons = vim.api.nvim_eval('{"git": 0, "folders": 1, "files": 1}')
-- vim.g.nvim_tree_root_folder_modifier = ':h'
vim.g.nvim_tree_bindings = {
  -- ["<C-v>"]          = tree_cb("vsplit"),
  -- ["<C-x>"]          = tree_cb("split"),
  -- ["<C-t>"]          = tree_cb("tabnew"),
  -- ["<BS>"]           = tree_cb("close_node"),
  -- ["<S-CR>"]         = tree_cb("close_node"),
  -- ["<Tab>"]          = tree_cb("preview"),
  -- ["I"]              = tree_cb("toggle_ignored"),
  -- ["H"]              = tree_cb("toggle_dotfiles"),
  -- ["R"]              = tree_cb("refresh"),
  -- ["a"]              = tree_cb("create"),
  -- ["d"]              = tree_cb("remove"),
  -- ["r"]              = tree_cb("rename"),
  -- ["<C-r>"]          = tree_cb("full_rename"),
  -- ["x"]              = tree_cb("cut"),
  -- ["c"]              = tree_cb("copy"),
  -- ["p"]              = tree_cb("paste"),
  -- ["q"]              = tree_cb("close"),
  ["<C-[>"]          = tree_cb("dir_up"),
  ["h"]              = tree_cb("close_node"),
  ["l"]              = tree_cb("edit"),
}

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

-- source other plugins
require('lsps/lsps')

