return {
    'saghen/blink.cmp',
    event = { 'InsertEnter', 'CmdlineEnter' },
    dependencies = {
        'saghen/blink.lib',
        'L3MON4D3/LuaSnip',
        'rafamadriz/friendly-snippets',
        'zbirenbaum/copilot.lua',
        {
            'fang2hou/blink-copilot',
            opts = {
                max_completions = 1,
                max_attempts = 2,
            },
        },
    },
    build = function() require('blink.cmp').build():pwait() end,

    opts = {
        keymap = {
            preset = 'default',
            ['<CR>'] = { 'accept', 'fallback' },
            ['<C-space>G'] = { function(cmp) return cmp.show({ providers = { 'copilot' } }) end },
        },

        sources = {
            default = {
                -- 'copilot',
                'minuet',
                'lsp',
                'snippets',
                'path',
                'buffer',
            },

            providers = {
                minuet = {
                    name = 'minuet',
                    module = 'minuet.blink',
                    async = true,
                    -- Should match minuet.config.request_timeout * 1000,
                    -- since minuet.config.request_timeout is in seconds
                    timeout_ms = 1500,
                    score_offset = 0, -- Gives minuet higher priority among suggestions
                },
                copilot = {
                    name = 'Copilot',
                    module = 'blink-copilot',
                    score_offset = 100,
                    async = true,
                },
            },
        },

        signature = { enabled = true },

        completion = {
            ghost_text = { enabled = true },
            documentation = { auto_show = true, auto_show_delay_ms = 250 },
            menu = {
                draw = {
                    columns = {
                        { 'kind_icon' },
                        { 'label', 'label_description', gap = 1 },
                        { 'kind', 'source_name', gap = 1 },
                    },
                },
                winblend = 10,
                scrollbar = false,
            },
        },
        cmdline = { completion = { menu = { auto_show = true } } },
        snippets = { preset = 'luasnip' },
        appearance = { nerd_font_variant = 'mono' },
    },
}
