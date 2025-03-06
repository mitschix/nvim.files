return {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local handle = io.popen('fortune -s -n 90')
        local fortune = handle:read('*a')
        handle:close()
        local startify = require('alpha.themes.startify')
        startify.section.header.val = {
            [[          ▄▄▄   ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄    ▄▄▄▄▄▄▄▄▄  ▄▄▄]],
            [[          ███   ███▀▀▀▀▀██▀▀█▀██  ██▀▀██▀███  ███]],
            [[          ██▀█  ███    ██    ███  ██  ██ ████████]],
            [[          ██ ██ █████████    ███  ██  ██ ██ ██ ██]],
            [[          ██  █▄███    ██    ██████   ██ ██ ▀▀ ██]],
            [[          ██   ████▄▄▄▄▄██▄▄██ ████ ▄▄██▄██    ██]],
            [[          ▀▀   ▀▀▀▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀ ▀▀▀▀▀▀▀    ▀▀]],
        }
        startify.section.header.opts = { position = 'center' }
        startify.section.top_buttons.opts = { position = 'center' }
        startify.section.bottom_buttons.opts = { position = 'center' }
        startify.section.footer.opts = { position = 'center' }
        startify.section.top_buttons.val = {
            startify.button('e', '  New file', ':ene <BAR> startinsert <CR>'),
        }
        startify.section.bottom_buttons.val = {
            { type = 'text', val = 'Commands', opts = { hl = 'SpecialComment', shrink_margin = false } },
            { type = 'padding', val = 1 },
            startify.button('t', ' Open NeoWarrior (tasks)', '<cmd>NeoWarrior current<CR>'),
            { type = 'padding', val = 1 },
            startify.button('ul', ' Open Lazy (Plugins)', '<cmd>Lazy<CR>'),
            startify.button('up', ' Sync Lazy (Plugins)', '<cmd>Lazy sync<CR>'),
            { type = 'padding', val = 1 },
            startify.button('ml', ' Open Mason (LSPs)', '<cmd>Mason<CR>'),
            { type = 'padding', val = 1 },
            startify.button('q', ' Quit NVIM', ':qa<CR>'),
        }
        startify.section.footer.val = {
            { type = 'text', val = fortune, opts = { position = 'center' } },
        }
        startify.opts.layout = {
            { type = 'padding', val = 8 },
            startify.section.header,
            { type = 'padding', val = 2 },
            startify.section.top_buttons,
            startify.section.mru,
            startify.section.mru_cwd,
            { type = 'padding', val = 1 },
            startify.section.bottom_buttons,
            { type = 'padding', val = 2 },
            startify.section.footer,
        }
        require('alpha').setup(startify.opts)
    end,
}
