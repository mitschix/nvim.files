

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

    -- git plugins
    -- pleanary - set of lua functions needed by gitsigns
    { 'lewis6991/gitsigns.nvim', dependencies = { 'nvim-lua/plenary.nvim' }},
    "kdheepak/lazygit.nvim",

    -- programming
    {'terrortylor/nvim-comment', config = function() require('nvim_comment').setup() end},
    {'dhruvasagar/vim-table-mode', lazy=true, cmd={'TableModeToggle'}},

    -- " completion
    -- https://github.com/hrsh7th/nvim-cmp
    {"hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-buffer",
            "ray-x/cmp-treesitter",
            "hrsh7th/cmp-path",
            "f3fora/cmp-spell",
            "hrsh7th/cmp-calc",
            "hrsh7th/cmp-emoji",
            {'tzachar/cmp-tabnine', build='./install.sh', dependencies = 'hrsh7th/nvim-cmp'}, -- needs unzip installed
            "hrsh7th/cmp-cmdline",
            { 'saadparwaiz1/cmp_luasnip' }
        }
    },

    -- snippets
    'L3MON4D3/LuaSnip',
    "rafamadriz/friendly-snippets",

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
