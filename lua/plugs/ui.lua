return {
    {
        'tiagovla/tokyodark.nvim',
        priority = 1000,
        config = function()
            require('tokyodark').setup({ transparent_background = true, gamma = 1.2 })
            vim.cmd('colorscheme tokyodark')

            -- Overwrite defaults of tokyodark
            vim.cmd([[
        highlight Normal guifg=#E8E8E8
        highlight Comment guifg=#7f8490
        ]])

            -- Highlight extra whitespaces
            vim.cmd('highlight ExtraWhitespace ctermbg=darkblue guibg=#81A2BE')
        end,
    },
    {
        'catgoose/nvim-colorizer.lua',
        opts = {
            options = {
                parsers = { css = true },
                display = {
                    mode = 'virtualtext',
                    virtualtext = {
                        position = 'before',
                    },
                },
            },
        },
        event = { 'BufReadPre' },
    },
    {
        'xiyaowong/nvim-cursorword',
        event = { 'BufReadPre', 'BufNewFile' },
        config = function() vim.cmd('highlight CursorWord gui=underline') end,
    },
    {
        'rcarriga/nvim-notify',
        init = function() vim.notify = require('notify') end,
        opts = { background_colour = '#000000' },
    },
    {
        'j-hui/fidget.nvim',
        opts = {},
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        main = 'ibl',
        config = function()
            local hooks = require('ibl.hooks')
            hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
            hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_tab_indent_level)
            require('ibl').setup({
                indent = {
                    char = { '¦', '┆', '┊' },
                },
                exclude = {
                    filetypes = { 'alpha', 'lspinfo', 'lazy', 'checkhealth', 'help', 'man', '' },
                },
                scope = {
                    priority = 0,
                    char = '┃',
                    include = {
                        node_type = {
                            ['*'] = {
                                'argument_list',
                                'arguments',
                                'assignment_statement',
                                'Block',
                                'chunk',
                                'class',
                                'ContainerDecl',
                                'dictionary',
                                'do_block',
                                'do_statement',
                                'element',
                                'except',
                                'FnCallArguments',
                                'for',
                                'for_statement',
                                'function',
                                'function_declaration',
                                'function_definition',
                                'if_statement',
                                'IfExpr',
                                'IfStatement',
                                'import',
                                'InitList',
                                'list_literal',
                                'method',
                                'object',
                                'ParamDeclList',
                                'repeat_statement',
                                'selector',
                                'SwitchExpr',
                                'table',
                                'table_constructor',
                                'try_statement',
                                'tuple',
                                'type',
                                'var',
                                'while',
                                'while_statement',
                                'with_statement',
                            },
                        },
                    },
                },
            })
        end,
    },
}
