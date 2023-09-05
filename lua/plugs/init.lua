return {
    -- useful tools
    {'mbbill/undotree', lazy=true, keys = {{'<leader>u', '<cmd>UndotreeToggle<CR>'}}},
    {'will133/vim-dirdiff', lazy=true, cmd = {'DirDiff'}},
    {"tversteeg/registers.nvim", config = true},
    {'unblevable/quick-scope', init = function() vim.g.qs_highlight_on_keys = {'f', 'F', 't', 'T'} end },

    -- syntax / highlights
    {'PotatoesMaster/i3-vim-syntax', lazy=true, ft = {"i3config",  "i3"}},
    {'NvChad/nvim-colorizer.lua', config = function () require('colorizer').setup() end},
    'xiyaowong/nvim-cursorword',

    {"ivanjermakov/troublesum.nvim", config = function ()
        require("troublesum").setup({
            severity_format = {"󰅚","󰀪","󰋽","󰌶"},
        })
    end},

    -- games
    {'ThePrimeagen/vim-be-good', lazy=true, cmd = {'VimBeGood'}},
    {'tamton-aquib/duck.nvim', config = function()
            vim.keymap.set('n', '<leader>dd', function() require("duck").hatch("🦆", 5) end, {})
            vim.keymap.set('n', '<leader>dk', function() require("duck").cook() end, {})
        end},
}
