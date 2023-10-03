return {
    'stevearc/conform.nvim',
    lazy = true,
    event = { 'BufWritePre' },
    config = function()
        local conform = require('conform')

        conform.setup({
            formatters_by_ft = {
                bash = { 'shfmt' },
                sh = { 'shfmt' },
                -- go = { "gofmt" }, -- gopls has formatting?
                lua = { 'stylua' },
                markdown = { 'markdown-toc', 'mdformat' },
                python = { 'isort', 'black' }, -- replaces pylsp formatting (with autopep8/yapf)
                tex = { 'latexindent' },
                yaml = { 'yamlfix' },
                ['*'] = { 'codespell' },
                ['_'] = { 'trim_whitespace', 'squeeze_blanks' },
            },
            format_on_save = {
                lsp_fallback = true,
                timeout_ms = 500,
            },
        })
    end,
}
