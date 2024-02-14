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
            '<leader>ot',
            ":<c-u>lua require('ollama').prompt('Translate_Text')<cr>",
            desc = 'ollama translate text',
            mode = { 'v' },
        },
    },

    opts = {
        url = 'http://127.0.0.1:11434',
        serve = {
            command = 'podman',
            args = {
                'run',
                '-d',
                '--replace',
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
        -- View the actual default prompts in ./lua/ollama/prompts.lua
        prompts = {
            Translate_Text = {
                prompt = 'Please translate the following text to $input:\n\n$sel',
                input_label = 'L (german/english/...) >',
            },
            Generate_Text = {
                prompt = 'Generate a short paragraph about the following: $input\n\n',
                action = 'insert',
                extract = '.*',
            },
        },
    },
}
