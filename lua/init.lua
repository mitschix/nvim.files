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
  -- { key = {"<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") },
  -- { key = {"<2-RightMouse>", "<C-]>"},    cb = tree_cb("cd") },
  -- { key = "<C-v>",                        cb = tree_cb("vsplit") },
  -- { key = "<C-x>",                        cb = tree_cb("split") },
  -- { key = "<C-t>",                        cb = tree_cb("tabnew") },
  -- { key = "<",                            cb = tree_cb("prev_sibling") },
  -- { key = ">",                            cb = tree_cb("next_sibling") },
  -- { key = "P",                            cb = tree_cb("parent_node") },
  -- { key = "<BS>",                         cb = tree_cb("close_node") },
  -- { key = "<S-CR>",                       cb = tree_cb("close_node") },
  -- { key = "<Tab>",                        cb = tree_cb("preview") },
  -- { key = "K",                            cb = tree_cb("first_sibling") },
  -- { key = "J",                            cb = tree_cb("last_sibling") },
  -- { key = "I",                            cb = tree_cb("toggle_ignored") },
  -- { key = "H",                            cb = tree_cb("toggle_dotfiles") },
  -- { key = "R",                            cb = tree_cb("refresh") },
  -- { key = "a",                            cb = tree_cb("create") },
  -- { key = "d",                            cb = tree_cb("remove") },
  -- { key = "r",                            cb = tree_cb("rename") },
  -- { key = "<C-r>",                        cb = tree_cb("full_rename") },
  -- { key = "x",                            cb = tree_cb("cut") },
  -- { key = "c",                            cb = tree_cb("copy") },
  -- { key = "p",                            cb = tree_cb("paste") },
  -- { key = "y",                            cb = tree_cb("copy_name") },
  -- { key = "Y",                            cb = tree_cb("copy_path") },
  -- { key = "gy",                           cb = tree_cb("copy_absolute_path") },
  -- { key = "[c",                           cb = tree_cb("prev_git_item") },
  -- { key = "]c",                           cb = tree_cb("next_git_item") },
  -- { key = "-",                            cb = tree_cb("dir_up") },
  -- { key = "q",                            cb = tree_cb("close") },
  -- { key = "g?",                           cb = tree_cb("toggle_help") },
  { key = "<C-[>",                        cb = tree_cb("dir_up") },
  { key = "h",                            cb = tree_cb("close_node") },
  { key = "l",                            cb = tree_cb("edit") },
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

