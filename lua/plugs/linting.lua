return {
    'mfussenegger/nvim-lint',
    lazy = true,
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        local lint = require('lint')

        lint.linters_by_ft = {
            -- markdown = { 'vale' }, -- needs ini?
            python = { 'pylint' },
            yaml = { 'yamllint' },
            ['*'] = { 'codespell' },
        }

        local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

        vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
            group = lint_augroup,
            callback = function() lint.try_lint() end,
        })
    end,
}
