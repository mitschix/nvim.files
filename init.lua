-- speedsup start of lua
-- check if impatient import works to skip if it fails
local module_status_ok, _ = pcall(require, "impatient")
if not module_status_ok then
    print("impatient not found.")
  return
end

-- https://github.com/ibhagwan/nvim-lua/blob/main/lua/init.lua
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0
