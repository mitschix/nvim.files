return {
    {
        'tiagovla/tokyodark.nvim',
        priority = 1000,
        config = function()
            require('tokyodark').setup({ transparent_background = true, gamma = 1.2 })
            vim.cmd('colorscheme tokyodark')

            -- Overwrite defaults of tokyodark
            vim.cmd([[
        highlight Normal guifg=#E8E8E8
        highlight Comment guifg=#7f8490
        ]])

            -- Highlight extra whitespaces
            vim.cmd('highlight ExtraWhitespace ctermbg=darkblue guibg=#81A2BE')
        end,
    },
    { 'NvChad/nvim-colorizer.lua', config = true, event = { 'BufReadPre', 'BufNewFile' } },
    {
        'xiyaowong/nvim-cursorword',
        event = { 'BufReadPre', 'BufNewFile' },
        config = function() vim.cmd('highlight CursorWord gui=underline') end,
    },
}
