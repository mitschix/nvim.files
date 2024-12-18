return {
    'olimorris/codecompanion.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-treesitter/nvim-treesitter',
    },
    opts = {
        strategies = {
            chat = { adapter = 'ollama', model = 'llama3:8b' },
            inline = { adapter = 'ollama', model = 'deepseek-coder-v2:16b' },
            agent = { adapter = 'ollama', model = 'llama3:8b' },
        },
        opts = {
            log_level = 'DEBUG',
        },
    },
}
