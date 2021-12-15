

-- === (PLUG)INS SETTINGS ===


-- automatically load vim-plug and install plugins
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    execute 'packadd packer.nvim'
end

-- auto compile
vim.api.nvim_exec(
  [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]],
  false
)

return require('packer').startup({function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- useful tools
    use {'unblevable/quick-scope',
        setup = [[vim.g.qs_highlight_on_keys = {'f', 'F', 't', 'T'}]]}
    use {'kdav5758/TrueZen.nvim', opt=true, cmd = {'TZMinimalist', 'TZAtaraxis'} } -- goyo replacement
    use {'mbbill/undotree', opt=true, cmd = {'UndotreeToggle'}}

    use {'voldikss/vim-floaterm', opt=true, cmd = {'FloatermNew'}} -- todo might be replaced by lspasge - floatterm
    use 'wsdjeg/vim-todo'
    use {'will133/vim-dirdiff', opt=true, cmd = {'DirDiff'}}
    use 'tversteeg/registers.nvim' -- previews registers
    use 'xiyaowong/nvim-cursorword'

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
        end}

    -- " completion
    use {'hrsh7th/nvim-compe',
        require = {
            {use 'sirver/ultisnips', setup = function ()
                    -- Trigger configuration.
                    vim.g.UltiSnipsExpandTrigger="sS"
                    vim.g.UltiSnipsJumpForwardTrigger="sF"
                    vim.g.UltiSnipsJumpBackwardTrigger="sB"
                    -- If you want :UltiSnipsEdit to split your window.
                    vim.g.UltiSnipsEditSplit="vertical"
                end},
            { use 'honza/vim-snippets'}}}
    -- " lsps
    use 'neovim/nvim-lspconfig'
    use 'tami5/lspsaga.nvim'
    use 'ray-x/lsp_signature.nvim'

    -- " syntax
    use {'PotatoesMaster/i3-vim-syntax', opt=true}
    use {'p00f/nvim-ts-rainbow'} -- replace old rainbow
    use {'norcalli/nvim-colorizer.lua', config = function() require('colorizer').setup() end}
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    use 'mechatroner/rainbow_csv'
    use {'andymass/vim-matchup', event = 'VimEnter'}

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
    use {'mhinz/vim-startify', requires = { use 'ryanoasis/vim-devicons', opt=true}}

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

end,
config = {
    display = {
        open_fn = require('packer.util').float,
    }
}})

