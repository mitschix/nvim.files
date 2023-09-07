return {
    -- useful tools
    {'mbbill/undotree', lazy=true, keys = {{'<leader>u', '<cmd>UndotreeToggle<CR>'}}},
    {'will133/vim-dirdiff', lazy=true, cmd = {'DirDiff'}},
    {"tversteeg/registers.nvim", cmd = "Registers",
    keys = {{"\"", mode = {"n", "v"}}, {"<C-R>", mode = "i"}}},
    {'dhruvasagar/vim-table-mode', lazy=true, cmd={'TableModeToggle'}},

    {'unblevable/quick-scope', lazy=true, keys = {'f', 'F', 't', 'T'},
    init = function() vim.g.qs_highlight_on_keys = {'f', 'F', 't', 'T'} end },

    {'dyng/ctrlsf.vim', lazy = true, cmd = {'CtrlSF'},
    config = function () vim.g.ctrlsf_position = 'right' end},

    -- syntax / highlights
    {'PotatoesMaster/i3-vim-syntax', lazy=true, ft = {"i3config",  "i3"}},
}
