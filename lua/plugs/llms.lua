return {
    'olimorris/codecompanion.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-treesitter/nvim-treesitter',
    },
    opts = {
        strategies = {
            chat = { adapter = 'ollama', model = 'deepseek-coder-v2:latest' },
            inline = { adapter = 'ollama', model = 'deepseek-coder-v2:latest' },
            agent = { adapter = 'ollama', model = 'deepseek-coder-v2:latest' },
        },
        opts = {
            log_level = 'DEBUG',
        },
    },
}
