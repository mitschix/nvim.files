return {
    'lukas-reineke/indent-blankline.nvim',
    event = { "BufReadPre", "BufNewFile" },
    config = function ()
        vim.cmd [[highlight IndentBlanklineContextChar guifg=#00AE00 gui=nocombine]]
        vim.cmd [[highlight IndentBlanklineContextStart gui=underline cterm=underline guisp=#00AE00]]
        require("indent_blankline").setup {
            show_first_indent_level = false,
            show_current_context = true,
            show_current_context_start = true,
            char_list = {'¦', '┆', '┊'},
            context_char = '┃',
            use_treesitter = true,
            filetype_exclude = {
                'alpha',
                "lspinfo",
                "packer",
                "checkhealth",
                "help",
                "man",
                ""
            }
        }
    end
}
