return {
    {
        'rcarriga/nvim-notify',
        init = function() vim.notify = require('notify') end,
        opts = { background_colour = '#000000' },
    },
    {
        'j-hui/fidget.nvim',
        opts = {},
    },
}
