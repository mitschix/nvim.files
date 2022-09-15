-- setup and configure minor plugins
-- treesitter config
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"bash","beancount","bibtex","c","c_sharp","cmake","comment","commonlisp","cooklang","cpp","css","dockerfile","go","gomod","gowork","graphql","hjson","hocon","html","http","java","javascript","jsdoc","json","json5","jsonc","julia","kotlin","lalrpop","latex","ledger","llvm","lua","make","ninja","nix","norg","pascal","perl","php","python","ql","query","r","regex","rego","rst","ruby","rust","scheme","scss","solidity","sparql","svelte","teal","toml","tsx","typescript","vim","yaml"
},
  highlight = {
    enable = true
  },
  rainbow = {enable = true}
}
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
local key_opts = {silent=true, noremap=true}

vim.api.nvim_set_keymap('n', '<F2>', ':NvimTreeToggle<CR>', key_opts)
vim.api.nvim_set_keymap('', '<f4>', ':Tagbar<CR>', key_opts)
vim.api.nvim_set_keymap('n', '<leader>u', ':UndotreeToggle<CR>', key_opts)

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

vim.keymap.set("n", "<leader>ss", function() require("spread").out() end)
vim.keymap.set("n", "<leader>sc", function() require("spread").combine() end)
