return {
    {'ThePrimeagen/vim-be-good', lazy=true, cmd = {'VimBeGood'}},
    {'tamton-aquib/duck.nvim', keys = {'<leader>dd'},
    config = function()
        vim.keymap.set('n', '<leader>dd', function() require("duck").hatch("🦆", 5) end, {})
        vim.keymap.set('n', '<leader>dk', function() require("duck").cook() end, {})
    end},
}
