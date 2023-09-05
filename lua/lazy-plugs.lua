

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
    {'mbbill/undotree', lazy=true, cmd = {'UndotreeToggle'}},
    {"ahmedkhalf/project.nvim", lazy = true,
    config = function() require("project_nvim").setup {} end },

    {
      "folke/todo-comments.nvim",
      dependencies = "nvim-lua/plenary.nvim",
      config = function() require("todo-comments").setup { } end,
      lazy=true, cmd = {'TodoLocList'}
    },
    -- Trouble to show diagnostics/loc list/quickfix prettier
    -- also show TODO if toggled
    {
        "folke/trouble.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function() require("trouble").setup { } end,
        lazy=true, cmd = {'Trouble'}
    },
    {'will133/vim-dirdiff', lazy=true, cmd = {'DirDiff'}},
    -- previews registers
    {"tversteeg/registers.nvim", config = function() require("registers").setup() end},
    'xiyaowong/nvim-cursorword',
    {"jbyuki/instant.nvim", lazy=true, cmd={'InstantStartServer','InstantJoinSession','InstantJoinSingle'},
        init = function () vim.g.instant_username = "mitschix" end},
    {'dyng/ctrlsf.vim', init = function () vim.g.ctrlsf_position = 'right' end},

    -- File explorer
    -- devicon for file icons
    {'nvim-tree/nvim-tree.lua', lazy = true, dependencies = {'nvim-tree/nvim-web-devicons'}},

    -- git plugins
    -- pleanary - set of lua functions needed by gitsigns
    { 'lewis6991/gitsigns.nvim', dependencies = { 'nvim-lua/plenary.nvim' }},
    "kdheepak/lazygit.nvim",

    -- programming
    {'terrortylor/nvim-comment', config = function() require('nvim_comment').setup() end},
    {'dhruvasagar/vim-table-mode', lazy=true, cmd={'TableModeToggle'}},
    'lukas-reineke/indent-blankline.nvim',

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

    -- " debug
    { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap"} },
    'theHamsta/nvim-dap-virtual-text',
    'mfussenegger/nvim-dap-python',

    -- " syntax
    {'m-demare/hlargs.nvim', dependencies = { 'nvim-treesitter/nvim-treesitter' },
        config = function () require('hlargs').setup{color = '#BFAAAA',
        excluded_argnames = {declarations = { python = { 'self' } }} } end},

    -- {'andymass/vim-matchup', event = 'VimEnter'} -- TODO does not work

    -- tags
    {'majutsushi/tagbar', lazy=true, cmd={'Tagbar'}, init = function() vim.g.tagbar_autofocus = 1 end} ,
    {'ludovicchabant/vim-gutentags', init = function ()
            --  vim gutentags settings
            vim.g.gutentags_add_default_project_roots = 0
            vim.g.gutentags_project_root = {'requirements.txt', '.git'}
            vim.g.gutentags_ctags_extra_args = {'--tag-relative=yes', '--fields=+ailmnS'}
            -- TODO does not work with lua?
            vim.cmd("let g:gutentags_cache_dir = stdpath('data').'//tags'")
        end},

    -- fuzzy search utils
    -- install fzf as command and as plugin
    {'junegunn/fzf', build = './install --all --xdg --no-update-rc' },
    'ibhagwan/fzf-lua',
    --
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
