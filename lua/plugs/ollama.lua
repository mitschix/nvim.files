return {
    'nomnivore/ollama.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },

    cmd = { 'Ollama' },

    keys = {
        -- Sample keybind for prompt menu. Note that the <c-u> is important for selections to work properly.
        {
            '<leader>oo',
            ":<c-u>lua require('ollama').prompt()<cr>",
            desc = 'ollama prompt',
            mode = { 'n', 'v' },
        },

        -- Sample keybind for direct prompting. Note that the <c-u> is important for selections to work properly.
        {
            '<leader>oG',
            ":<c-u>lua require('ollama').prompt('Generate_Code')<cr>",
            desc = 'ollama Generate Code',
            mode = { 'n', 'v' },
        },
    },

    opts = {
        url = 'http://127.0.0.1:11434',
        serve = {
            command = 'podman',
            args = {
                'run',
                '-d',
                '--rm',
                '-p',
                '11434:11434',
                '--name',
                'ollama',
                'docker.io/ollama/ollama',
            },
            stop_command = 'podman',
            stop_args = { 'stop', 'ollama' },
        },
    },
}
