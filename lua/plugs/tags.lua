return {
    {
        'preservim/tagbar',
        lazy = true,
        cmd = { 'TagbarToggle' },
        keys = { { '<F4>', '<cmd>TagbarToggle<CR>', '' } },
        config = function() vim.g.tagbar_autofocus = 1 end,
    },

    {
        'ludovicchabant/vim-gutentags',
        event = { 'BufReadPre', 'BufNewFile' },
        config = function()
            --  vim gutentags settings
            local tags_path = vim.fn.stdpath('data') .. '//tags'
            if vim.fn.isdirectory(tags_path) == 0 then vim.fn.mkdir(tags_path, 'p') end
            vim.g.gutentags_add_default_project_roots = 0
            vim.g.gutentags_project_root = { 'requirements.txt', '.git' }
            vim.g.gutentags_ctags_extra_args = { '--tag-relative=yes', '--fields=+ailmnS' }
            vim.g.gutentags_cache_dir = tags_path
        end,
    },
}
