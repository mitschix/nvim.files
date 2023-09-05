-- setup and configure minor plugins
vim.cmd [[highlight IndentBlanklineContextChar guifg=#00AE00 gui=nocombine]]
require("indent_blankline").setup {
    show_first_indent_level = false,
    show_current_context = true,
    char_list = {'¦', '┆', '┊'},
    context_char = '┃',
    use_treesitter = true,
    filetype_exclude = { 'alpha', "lspinfo", "packer", "checkhealth", "help", "man", "" }
}

-- plugin mappings
local key_opts = {silent=true}

vim.keymap.set('n', '<F2>', ':NvimTreeToggle<CR>', key_opts)

-- short Plugin shortcuts {{{

-- Trouble shortcuts {{{
vim.keymap.set("n", "<leader>xx", "<CMD>Trouble<CR>")
vim.keymap.set("n", "<leader>xw", "<CMD>Trouble workspace_diagnostics<CR>")
vim.keymap.set("n", "<leader>xd", "<CMD>Trouble document_diagnostics<CR>")
vim.keymap.set("n", "<leader>xl", "<CMD>Trouble loclist<CR>")
vim.keymap.set("n", "<leader>xq", "<CMD>Trouble quickfix<CR>")
vim.keymap.set("n", "gR", "<CMD>Trouble lsp_references<CR>")
-- }}}

-- }}}
