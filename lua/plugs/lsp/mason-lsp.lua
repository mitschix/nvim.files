return {
    {
        'williamboman/mason.nvim',
        dependencies = { 'WhoIsSethDaniel/mason-tool-installer.nvim' },
        lazy = true,
        cmd = { 'Mason' },
        config = function()
            require('mason').setup({
                ui = { icons = { package_installed = '✓', package_pending = '➜', package_uninstalled = '✗' } },
            })

            -- LSP diagnostics color config {{{
            -- TODO highlight currently not in vim.api
            vim.cmd([[
                hi DiagnosticDefaultError ctermfg=red guifg=#D54E53
                hi DiagnosticVirtualTextError ctermfg=red  guifg=#D54E53

                hi DiagnosticDefaultWarn ctermfg=yellow guifg=#E7C547
                hi DiagnosticVirtualTextWarn ctermfg=yellow guifg=#E7C547

                hi DiagnosticDefaultInfo ctermfg=white guifg=#EAEAEA
                hi DiagnosticVirtualTextInfo ctermfg=white guifg=#EAEAEA

                hi DiagnosticDefaultHint ctermfg=blue guifg=#7AA6DA
                hi DiagnosticVirtualTextHint ctermfg=blue guifg=#7AA6DA
            ]])
            -- }}}

            -- remove diagnostic signs and only color numbers
            vim.fn.sign_define('DiagnosticSignError', { text = '', numhl = 'DiagnosticDefaultError' })
            vim.fn.sign_define('DiagnosticSignWarn', { text = '', numhl = 'DiagnosticDefaultWarn' })
            vim.fn.sign_define('DiagnosticSignInfo', { text = '', numhl = 'DiagnosticDefaultInfo' })
            vim.fn.sign_define('DiagnosticSignHint', { text = '', numhl = 'DiagnosticDefaultHint' })

            local mason_tool_installer = require('mason-tool-installer')
            mason_tool_installer.setup({
                ensure_installed = {
                    -- formatters (shell, lua, python, markdown, latex, yaml, spelling)
                    'shfmt',
                    'stylua',
                    'markdown-toc',
                    'mdformat',
                    'latexindent',
                    'yamlfix',
                    -- linters
                    'codespell', -- is used by formatter but found at linters
                    'pylint',
                    -- 'vale',
                    'yamllint',
                },
            })
        end,
    },

    { 'ray-x/lsp_signature.nvim', lazy = true }, -- has no trigger -> triggered on lsp attach
    {
        'nvimdev/lspsaga.nvim',
        lazy = true,
        config = function()
            require('lspsaga').setup({
                symbol_in_winbar = {
                    enable = false,
                    show_file = false,
                },
                rename = {
                    in_select = false,
                },
                finder = {
                    toggle_or_open = '<CR>',
                },
                lightbulb = {
                    sign = false,
                },
                code_action = {
                    extend_gitsigns = true,
                },
            })
        end,
        keys = {
            { 'gr', '<cmd>Lspsaga finder<CR>', desc = 'Lspsaga Finder (References/Implementations)', buffer = true },
            {
                'gd',
                '<cmd>Lspsaga goto_definition<CR>',
                desc = 'Lspsaga Goto Definition',
                buffer = true,
            },
            { '<leader>rn', '<cmd>Lspsaga rename<CR>', desc = 'Lspsaga Rename', buffer = true },
            { '<leader>ca', '<cmd>Lspsaga code_action<CR>', desc = 'Lspsaga Code Action', buffer = true },
            {
                'cd',
                '<cmd>Lspsaga show_line_diagnostics<CR>',
                desc = 'Lspsaga Show Line Diagnostics',
                buffer = true,
            },
            { 'K', '<cmd>Lspsaga hover_doc<CR>', desc = 'Lspsaga Hover Doc', buffer = true },
            {
                '[D',
                '<cmd>Lspsaga diagnostic_jump_prev<CR>',
                desc = 'Lspsaga Jump Previous Diagnostics',
                buffer = true,
            },
            { ']D', '<cmd>Lspsaga diagnostic_jump_next<CR>', desc = 'Lspsaga Jump Next Diagnostics', buffer = true },
            { '<F4>', '<cmd>Lspsaga outline<CR>', desc = 'Lspsaga Outline', buffer = true },
        },
        event = 'LspAttach',
    },

    -- show (lsp) diagnostics msg on the upper right corner
    -- show only lsp boxes
    {
        'Mofiqul/trld.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        config = function()
            vim.diagnostic.config({ virtual_text = { format = function() return '' end } })
            require('trld').setup({
                formatter = function(diag)
                    local u = require('trld.utils')
                    local diag_lines = {}

                    for line in diag.message:gmatch('[^\n]+') do
                        line = line:gsub('[ \t]+%f[\r\n%z]', '')
                        line = diag.source .. ': ' .. line
                        table.insert(diag_lines, line)
                    end

                    local lines = {}
                    for _, diag_line in ipairs(diag_lines) do
                        table.insert(lines, { { diag_line .. ' ', u.get_hl_by_serverity(diag.severity) } })
                    end

                    return lines
                end,
            })
        end,
    },
}
