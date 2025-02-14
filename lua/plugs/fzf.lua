return {
    -- install fzf as command and as plugin
    { 'junegunn/fzf', build = './install --all --xdg --no-update-rc', lazy = true },
    {
        'ibhagwan/fzf-lua',
        cmd = { 'FzfLua' },
        keys = {
            '<leader>pf',
            '<leader>pF',
            '<leader>pl',
            '<leader>pL',
            '<leader>pb',
            '<leader>pg',
            '<leader>pk',
            '<leader>e',
        },
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            -- fzf-lua {{{
            local fzf_lua = require('fzf-lua')

            fzf_lua.setup({
                fzf_opts = { ['--layout'] = 'default' },
            })
            -- inspired by fzf.vim from https://github.com/uolot/dotfiles/blob/master/vim/files-fzf.vim
            local hide_preview = { winopts = { preview = { hidden = 'hidden' } } }
            vim.keymap.set('n', '<leader>pf', function() fzf_lua.git_files() end)
            vim.keymap.set('n', '<leader>pF', function() fzf_lua.files() end)
            vim.keymap.set('n', '<leader>pl', function() fzf_lua.blines(hide_preview) end)
            vim.keymap.set('n', '<leader>pL', function() fzf_lua.lines(hide_preview) end)
            vim.keymap.set('n', '<leader>pb', function() fzf_lua.buffers() end)
            vim.keymap.set('n', '<leader>pg', function() fzf_lua.grep(hide_preview) end)
            vim.keymap.set('n', '<leader>pk', function() fzf_lua.keymaps() end)
            -- Opens with the path of the currently edited file filled in
            vim.keymap.set('n', '<leader>e', function() fzf_lua.files({ cwd = vim.fn.expand('%:p:h') }) end)
            -- }}}
        end,
    },
}
