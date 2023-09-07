

-- === (PLUG)INS SETTINGS ===


-- automatically load plugin manager and install plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    {import = "plugs"},
    {import = "plugs.cmp"},

    {'terrortylor/nvim-comment', config = function() require('nvim_comment').setup() end},

    {import = "plugs.lsp"},
}
local opts = {
    install = {
        colorscheme = { "tokyodark" },
    },
    checker = {
        enabled = true,
        notify = false,
    },
    change_detection = {
        notify = false,
    }
}
require("lazy").setup(plugins, opts)
