return {
    -- tobira watches how you actually edit. When it spots a pattern you could do better,
    -- it quietly shows you the one command that would have helped
    'kamegoro/tobira.nvim',
    dependencies = {
        {
            'rcarriga/nvim-notify',
            init = function() vim.notify = require('notify') end,
            opts = { background_colour = '#000000' },
        },
    },
    event = 'VeryLazy',
    opts = {
        idle_delay = 5000, -- ms if inactivity
    },
}
