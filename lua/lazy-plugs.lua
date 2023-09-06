

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
    -- useful tools
    {'unblevable/quick-scope', init = function() vim.g.qs_highlight_on_keys = {'f', 'F', 't', 'T'} end },

    -- previews registers
    {"jbyuki/instant.nvim", lazy=true, cmd={'InstantStartServer','InstantJoinSession','InstantJoinSingle'},
        init = function () vim.g.instant_username = "mitschix" end},
    {'dyng/ctrlsf.vim', init = function () vim.g.ctrlsf_position = 'right' end},

    -- programming
    {'terrortylor/nvim-comment', config = function() require('nvim_comment').setup() end},
    {'dhruvasagar/vim-table-mode', lazy=true, cmd={'TableModeToggle'}},

    -- " lsps
    'neovim/nvim-lspconfig',
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    'tami5/lspsaga.nvim',
    'ray-x/lsp_signature.nvim',

    -- {'andymass/vim-matchup', event = 'VimEnter'} -- TODO does not work
    -- themes
    'tiagovla/tokyodark.nvim',
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
