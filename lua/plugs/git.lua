return {
    -- git plugins
    -- pleanary - set of lua functions needed by gitsigns
    { 'lewis6991/gitsigns.nvim',
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function ()
        require('gitsigns').setup{signs={add={text='+'},change={text='~'}}}


        -- GitSigns color preference
        vim.cmd([[
        hi GitSignsChange ctermfg=yellow guifg=#E0C387
        hi GitSignsDelete ctermfg=red guifg=#BF616A
        ]])

        local key_opts = {silent=true}
        vim.keymap.set('n', '<leader>gb', ':Gitsigns toggle_current_line_blame<CR>', key_opts)
        vim.keymap.set('n', '<leader>gd', ':Gitsigns preview_hunk<CR>', key_opts)
        vim.keymap.set('n', '<leader>gr', ':Gitsigns reset_hunk<CR>', key_opts)
        vim.keymap.set('n', '<leader>gn', ':Gitsigns next_hunk<CR>', key_opts)
        vim.keymap.set('n', '<leader>gp', ':Gitsigns prev_hunk<CR>', key_opts)
        vim.keymap.set('n', '<leader>gs', ':Gitsigns stage_hunk<CR>', key_opts)
        vim.keymap.set('n', '<leader>gu', ':Gitsigns undo_stage_hunk<CR>', key_opts)
    end
    },

    {"kdheepak/lazygit.nvim", lazy=true, cmd = 'LazyGit',
    keys = {{'<leader>gg', '<cmd>LazyGit<CR>'}}}
}
