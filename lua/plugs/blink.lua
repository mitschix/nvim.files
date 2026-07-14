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
        },

        sources = {
            default = {
                'copilot',
                'lsp',
                'snippets',
                'path',
                'buffer',
            },

            providers = {
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
