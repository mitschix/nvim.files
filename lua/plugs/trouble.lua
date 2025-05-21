return {
    -- Trouble to show diagnostics/loc list/quickfix prettier
    -- also show TODO if toggled
    {
        'folke/trouble.nvim',
        lazy = true,
        cmd = 'Trouble',
        dependencies = 'nvim-tree/nvim-web-devicons',
        opts = {
            win = { position = 'right' },
            auto_preview = false,
        },
        keys = {
            {
                '<leader>xx',
                '<cmd>Trouble diagnostics toggle<cr>',
                desc = 'Diagnostics (Trouble)',
            },
            {
                '<leader>xX',
                '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
                desc = 'Buffer Diagnostics (Trouble)',
            },
            {
                '<leader>xs',
                '<cmd>Trouble symbols toggle focus=false<cr>',
                desc = 'Symbols (Trouble)',
            },
            {
                '<leader>xl',
                '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
                desc = 'LSP Definitions / references / ... (Trouble)',
            },
            {
                '<leader>xL',
                '<cmd>Trouble loclist toggle<cr>',
                desc = 'Location List (Trouble)',
            },
            {
                '<leader>xQ',
                '<cmd>Trouble qflist toggle<cr>',
                desc = 'Quickfix List (Trouble)',
            },
        },
    },
    {
        'folke/todo-comments.nvim',
        dependencies = { 'nvim-lua/plenary.nvim', 'folke/trouble.nvim' },
        config = true,
        lazy = true,
        cmd = { 'Trouble' },
        keys = { { '<leader>xt', '<CMD>Trouble todo<CR>' } },
    },
}
