return {
    {
        'olimorris/codecompanion.nvim',
        keys = {
            { '<leader>ac', '<cmd>CodeCompanionChat Toggle<cr>', desc = 'Open Code Companion Chat' },
            { '<leader>aa', '<cmd>CodeCompanionActions<cr>', desc = 'Open Code Companion Actions' },
        },
        cmd = { 'CodeCompanionChat' },
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-treesitter/nvim-treesitter',
        },
        opts = {
            adapters = {
                http = {
                    copilot = function()
                        return require('codecompanion.adapters').extend('copilot', {
                            schema = {
                                model = {
                                    default = 'gpt-4.1',
                                },
                            },
                        })
                    end,
                },
            },
            opts = {
                log_level = 'TRACE',
            },
        },
    },
    {
        'zbirenbaum/copilot.lua',
        cmd = 'Copilot',
        event = 'InsertEnter',
        opts = {
            filetypes = {
                help = false,
                gitcommit = false,
                gitrebase = false,
                hgcommit = false,
                svn = false,
                cvs = false,
                go = true,
                rust = true,
                lua = true,
                ['*'] = function()
                    if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), '^%.env.*') then
                        -- disable for .env files
                        return false
                    end
                    return true
                end,
            },
        },
    },
    {
        'milanglacier/minuet-ai.nvim',
        opts = {
            provider = 'openai_fim_compatible',
            n_completions = 1,
            context_window = 1024,

            provider_options = {
                openai_fim_compatible = {
                    api_key = 'TERM',

                    name = 'Llama.cpp',
                    end_point = 'http://localhost:8012/v1/completions',
                    optional = {
                        temperature = 0.15,
                        max_tokens = 128,
                        top_p = 0.9,
                    },
                    -- Llama.cpp does not support the `suffix` option in FIM completion.
                    -- Therefore, we must disable it and manually populate the special
                    -- tokens required for FIM completion.
                    template = {
                        prompt = function(context_before_cursor, context_after_cursor, _)
                            return '<|fim_prefix|>'
                                .. context_before_cursor
                                .. '<|fim_suffix|>'
                                .. context_after_cursor
                                .. '<|fim_middle|>'
                        end,
                        suffix = false,
                    },
                },
            },
        },
    },
}
