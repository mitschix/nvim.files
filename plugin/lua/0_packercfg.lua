

-- === (PLUG)INS SETTINGS ===


-- automatically load vim-plug and install plugins
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- auto compile
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost 0_packercfg.lua source <afile> | PackerCompile
  augroup end
]])


return require('packer').startup({function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- useful tools
    use {'unblevable/quick-scope',
        setup = [[vim.g.qs_highlight_on_keys = {'f', 'F', 't', 'T'}]]}
    use {'kdav5758/TrueZen.nvim', opt=true, cmd = {'TZMinimalist', 'TZAtaraxis'} } -- goyo replacement
    use {'mbbill/undotree', opt=true, cmd = {'UndotreeToggle'}}

    -- use {'voldikss/vim-floaterm', opt=true, cmd = {'FloatermNew'}} -- todo replace akinsho/toggleterm.nvim https://github.com/akinsho/toggleterm.nvim
    use {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function() require("todo-comments").setup { } end
    }
    use {'will133/vim-dirdiff', opt=true, cmd = {'DirDiff'}}
    use 'tversteeg/registers.nvim' -- previews registers
    use 'xiyaowong/nvim-cursorword'
    use {"jbyuki/instant.nvim", opt=true, cmd={'InstantStartServer','InstantJoinSession','InstantJoinSingle'},
        setup = function () vim.g.instant_username = "mitschix" end}

    -- cocsearch replacement @todo configure it
    -- use {'dyng/ctrlsf.vim', opt=true, cmd = {''}}
    use {'dyng/ctrlsf.vim', setup = [[vim.g.ctrlsf_position = 'right']]}


    -- File explorer
    -- devicon for file icons
    use {'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons', opt=true }}

    -- git plugins
    -- pleanary - set of lua functions needed by gitsigns
    use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' }}

    -- programming
    use {'terrortylor/nvim-comment', config = function() require('nvim_comment').setup() end}
    use {'dhruvasagar/vim-table-mode', opt=true, cmd={'TableModeToggle'}}
    use {'dbeniamine/cheat.sh-vim', opt=true}
    use {'Yggdroot/indentLine', setup = function ()
            -- indentline settings
            vim.g.indentLine_enabled = 1
            vim.g.indentLine_concealcursor = 0
            vim.g.indentLine_char = '┆'
            vim.g.indentLine_faster = 1
            vim.g.indentLine_fileTypeExclude = {'alpha'}
        end}

    -- " completion
    -- https://github.com/hrsh7th/nvim-cmp
    use {"hrsh7th/nvim-cmp",
        require = {
            use "hrsh7th/cmp-nvim-lsp",
            use "hrsh7th/cmp-nvim-lua",
            use "hrsh7th/cmp-buffer",
            use "ray-x/cmp-treesitter",
            use "hrsh7th/cmp-path",
            use "f3fora/cmp-spell",
            use "hrsh7th/cmp-calc",
            use "hrsh7th/cmp-emoji",
            use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}, -- needs unzip installed
            -- use "hrsh7th/cmp-cmdline", --TODO have a look
            use { 'saadparwaiz1/cmp_luasnip' }
        }
    }

    -- snippets
    use { 'L3MON4D3/LuaSnip' }
    use "rafamadriz/friendly-snippets"

    -- " lsps
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'tami5/lspsaga.nvim'
    use 'ray-x/lsp_signature.nvim'

    -- " debug
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    use 'theHamsta/nvim-dap-virtual-text'
    use 'mfussenegger/nvim-dap-python'


    -- " syntax
    use {'PotatoesMaster/i3-vim-syntax', opt=true}
    use {'p00f/nvim-ts-rainbow'} -- replace old rainbow
    use {'norcalli/nvim-colorizer.lua', config = function() require('colorizer').setup() end}
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    use 'mechatroner/rainbow_csv'
    -- use {'andymass/vim-matchup', event = 'VimEnter'} -- TODO does not work

    -- tags
    use {'majutsushi/tagbar', opt=true, cmd={'Tagbar'}, setup = [[vim.g.tagbar_autofocus = 1]]}
    use {'ludovicchabant/vim-gutentags', setup = function ()
            --  vim gutentags settings
            vim.g.gutentags_add_default_project_roots = 0
            vim.g.gutentags_project_root = {'requirements.txt', '.git'}
            vim.g.gutentags_ctags_extra_args = {'--tag-relative=yes', '--fields=+ailmnS'}
            -- TODO does not work with lua?
            vim.cmd("let g:gutentags_cache_dir = stdpath('data').'//tags'")
        end}

    -- " start screen with file type icons
    use {'goolord/alpha-nvim'}

    -- fuzzy search utils
    -- install fzf as command and as plugin
    use {'junegunn/fzf', run = './install --all --xdg --no-zsh --no-bash' }
    use 'junegunn/fzf.vim'
    --
    -- themes
    use {'mitschix/plastic.vim', opt=true, cmd = {'colorscheme plastic'}}
    use 'sainnhe/sonokai'

    -- others
    use {'ThePrimeagen/vim-be-good', opt=true, cmd = {'VimBeGood'}}
    -- lua module loading speedup -> improve starttime
    use 'lewis6991/impatient.nvim'


    -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
    require('packer').compile()
  end
end,
config = {
    display = {
        open_fn = require('packer.util').float,
    }
}})

