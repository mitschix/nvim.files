

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
    },
    performance = {
        rtp = {
            disabled_plugins = {
                "man",
                "netrw",
                "netrwFileHandlers",
                "netrwPlugin",
                "netrwSettings",
                "rplugin",
                "tohtml",
                "tutor",

                -- not exessively used but still nice to haves
                -- "editorconfig",
                -- "health",
                -- "matchit",
                -- "matchparen",
                -- "spellfile",
                -- "spellfile_plugin",
                -- "tar",
                -- "tarPlugin",
                -- "gzip",
                -- "zip",
                -- "zipPlugin",
            },
        },
    },
}
vim.keymap.set('n', '<leader>zz', '<cmd>Lazy<CR>', {desc='Open lazy UI'})
vim.keymap.set('n', '<leader>zi', '<cmd>Lazy install<CR>', {desc='Lazy install'})
vim.keymap.set('n', '<leader>zu', '<cmd>Lazy update<CR>', {desc='Lazy update'})
vim.keymap.set('n', '<leader>zc', '<cmd>Lazy clean<CR>', {desc='Lazy clean'})
vim.keymap.set('n', '<leader>zp', '<cmd>Lazy profile<CR>', {desc='Lazy profile'})
vim.keymap.set('n', '<leader>zs', '<cmd>Lazy sync<CR>', {desc='Lazy sync'})

require("lazy").setup(plugins, opts)
