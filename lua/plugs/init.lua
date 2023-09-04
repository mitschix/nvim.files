return {
    -- syntax
    {'PotatoesMaster/i3-vim-syntax', lazy=true, ft = {"i3config",  "i3"}},
    'mechatroner/rainbow_csv',

    {"ivanjermakov/troublesum.nvim", config = function ()
        require("troublesum").setup({
            severity_format = {"󰅚","󰀪","󰋽","󰌶"},
        })
    end},

    {'ThePrimeagen/vim-be-good', lazy=true, cmd = {'VimBeGood'}},

    {'tamton-aquib/duck.nvim', config = function()
            vim.keymap.set('n', '<leader>dd', function() require("duck").hatch("🦆", 5) end, {})
            vim.keymap.set('n', '<leader>dk', function() require("duck").cook() end, {})
        end},
}
