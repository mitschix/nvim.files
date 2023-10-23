return {
    {
        'Wansmer/treesj',
        keys = { { '<leader>j', function() require('treesj').toggle() end } },
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        config = function()
            require('treesj').setup({
                -- Use default keymaps (<space>m - toggle, <space>j - join, <space>s - split)
                use_default_keymaps = false,
            })
        end,
    },
}
