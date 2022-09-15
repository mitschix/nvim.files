-- setup and configure minor plugins
-- treesitter config {{{
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"bash","beancount","bibtex","c","c_sharp","cmake","comment","commonlisp","cooklang","cpp","css","dockerfile","go","gomod","gowork","graphql","hjson","hocon","html","http","java","javascript","jsdoc","json","json5","jsonc","julia","kotlin","lalrpop","latex","ledger","llvm","lua","make","ninja","nix","norg","pascal","perl","php","python","ql","query","r","regex","rego","rst","ruby","rust","scheme","scss","solidity","sparql","svelte","teal","toml","tsx","typescript","vim","yaml"
},
  highlight = {
    enable = true
  },
  rainbow = {enable = true}
}
-- }}}

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
vim.keymap.set('', '<f4>', ':Tagbar<CR>', key_opts)
vim.keymap.set('n', '<leader>u', ':UndotreeToggle<CR>', key_opts)

-- short Plugin shortcuts {{{

-- Trouble shortcuts {{{
vim.keymap.set("n", "<leader>xx", "<CMD>Trouble<CR>")
vim.keymap.set("n", "<leader>xw", "<CMD>Trouble workspace_diagnostics<CR>")
vim.keymap.set("n", "<leader>xd", "<CMD>Trouble document_diagnostics<CR>")
vim.keymap.set("n", "<leader>xl", "<CMD>Trouble loclist<CR>")
vim.keymap.set("n", "<leader>xq", "<CMD>Trouble quickfix<CR>")
vim.keymap.set("n", "gR", "<CMD>Trouble lsp_references<CR>")
-- }}}

-- fzf-lua {{{

require("fzf-lua").setup({
    fzf_opts = { ['--layout'] = "default" },
})
-- inspired by fzf.vim from https://github.com/uolot/dotfiles/blob/master/vim/files-fzf.vim
local hide_preview = { winopts = { preview={hidden="hidden"} }}
vim.keymap.set('n', '<leader>pf', function() require('fzf-lua').files() end)
vim.keymap.set('n', '<leader>pl', function() require('fzf-lua').blines(hide_preview) end)
vim.keymap.set('n', '<leader>pL', function() require('fzf-lua').lines(hide_preview) end)
vim.keymap.set('n', '<leader>pb', function() require('fzf-lua').buffers() end)
vim.keymap.set('n', '<leader>pg', function() require('fzf-lua').grep(hide_preview) end)
vim.keymap.set('n', '<leader>pk', function() require('fzf-lua').keymaps() end)

-- Opens with the path of the currently edited file filled in
vim.keymap.set('n', '<leader>e', function() require('fzf-lua').files({cwd = vim.fn.expand('%:p:h')}) end)
-- }}}

-- }}}

-- Spread shortcuts
vim.keymap.set("n", "<leader>ss", function() require("spread").out() end)
vim.keymap.set("n", "<leader>sc", function() require("spread").combine() end)
