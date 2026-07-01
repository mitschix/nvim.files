return {
    -- tobira watches how you actually edit. When it spots a pattern you could do better,
    -- it quietly shows you the one command that would have helped
    {
        'kamegoro/tobira.nvim',
        event = 'VeryLazy',
        opts = {
            idle_delay = 5000, -- ms if inactivity
        },
    },
}
