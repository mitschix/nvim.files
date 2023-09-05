return {
    -- useful tools
    {'mbbill/undotree', lazy=true, keys = {{'<leader>u', '<cmd>UndotreeToggle<CR>'}}},
    {'will133/vim-dirdiff', lazy=true, cmd = {'DirDiff'}},
    {"tversteeg/registers.nvim", config = true, event = { "BufReadPre", "BufNewFile" }},
    {'unblevable/quick-scope', init = function() vim.g.qs_highlight_on_keys = {'f', 'F', 't', 'T'} end },

    -- syntax / highlights
    {'PotatoesMaster/i3-vim-syntax', lazy=true, ft = {"i3config",  "i3"}},
    {'NvChad/nvim-colorizer.lua', config = true, event = { "BufReadPre", "BufNewFile" }},
    {'xiyaowong/nvim-cursorword', event = { "BufReadPre", "BufNewFile" }},

    {"ivanjermakov/troublesum.nvim", config = function ()
        require("troublesum").setup({
            severity_format = {"󰅚","󰀪","󰋽","󰌶"},
        })
    end},
}
