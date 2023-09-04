-- https://github.com/ibhagwan/nvim-lua/blob/main/lua/init.lua
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

vim.opt.termguicolors = true
require('core')
require("lazy-plugs")
