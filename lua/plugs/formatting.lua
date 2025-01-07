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
                python = { 'ruff_organize_imports', 'ruff_format' },
                tex = { 'latexindent' },
                -- yaml = { 'yamlfix' }, -- messed up some configs
                -- Use the "*" filetype to run formatters on all filetypes.
                -- ['*'] = { 'codespell' }, -- renamed variables and crashed code
                -- Use the "_" filetype to run formatters on filetypes that don't
                -- have other formatters configured.
                ['_'] = { 'trim_whitespace', 'squeeze_blanks' },
            },
            format_on_save = {
                lsp_fallback = true,
                timeout_ms = 500,
            },
        })
    end,
}
