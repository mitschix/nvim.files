return {
    -- useful tools
    { 'will133/vim-dirdiff', lazy = true, cmd = { 'DirDiff' } },
    { 'dhruvasagar/vim-table-mode', lazy = true, cmd = { 'TableModeToggle' } },

    { 'mbbill/undotree', lazy = true, keys = { { '<leader>u', '<cmd>UndotreeToggle<CR>' } } },

    {
        'tversteeg/registers.nvim',
        config = true,
        cmd = 'Registers',
        keys = { { '"', mode = { 'n', 'v' } }, { '<C-R>', mode = 'i' } },
    },

    {
        'unblevable/quick-scope',
        lazy = true,
        keys = { 'f', 'F', 't', 'T' },
        init = function() vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' } end,
    },

    { 'dyng/ctrlsf.vim', lazy = true, cmd = { 'CtrlSF' }, config = function() vim.g.ctrlsf_position = 'right' end },

    -- {
    --     'terrortylor/nvim-comment',
    --     config = function() require('nvim_comment').setup() end,
    --     cmd = { 'CommentToggle' },
    --     keys = { 'gcc', { 'gc', mode = 'v' } },
    -- },

    -- syntax / highlights
    { 'mboughaba/i3config.vim', lazy = true, ft = { 'i3config', 'i3' } },

    -- replace netrw-gx (nvim-tree can be lazy loaded and netrw can be disabled)
    { 'TobinPalmer/BetterGX.nvim', keys = { { 'gx', '<CMD>lua require("better-gx").BetterGx()<CR>' } } },

    {
        'duckdm/neowarrior.nvim',
        lazy = true,
        branch = 'develop',
        keys = {
            { '<leader>nn', '<cmd>NeoWarriorOpen above<CR>' },
            { '<leader>na', '<cmd>NeoWarriorAdd<CR>' },
        },
        cmd = 'NeoWarriorOpen',
        config = function()
            require('neowarrior').setup({ mode = 'grouped' })
            vim.keymap.set('n', '<leader>nr', '<cmd>NeoWarriorRefresh<CR>')
        end,
    },
}
