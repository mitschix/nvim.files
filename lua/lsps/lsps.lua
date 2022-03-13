-- remove diagnostic signs and only color numbers
vim.fn.sign_define("DiagnosticSignError", {text = "", numhl = "DiagnosticDefaultError"})
vim.fn.sign_define("DiagnosticSignWarn", {text = "", numhl = "DiagnosticDefaultWarn"})
vim.fn.sign_define("DiagnosticSignInfo", {text = "", numhl = "DiagnosticDefaultInfo"})
vim.fn.sign_define("DiagnosticSignHint", {text = "", numhl = "DiagnosticDefaultHint"})

-- Setup lspconfig for cmp
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require'lsp_signature'.setup()

-- pip install 'python-lsp-server[all]'
require'lspconfig'.pylsp.setup{
    settings = {
        pyls = {
            plugins = {
                pylint = {enabled = true; }
            }
        }
    },
    capabilities = capabilities
}


-- go install golang.org/x/tools/gopls@latest
-- needs a .git to be attached
-- root_dir = root_pattern("go.mod", ".git")
require'lspconfig'.gopls.setup{
    settings = {
        gopls = {
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
      },
    },
    capabilities = capabilities
}

-- sudo npm install -g vim-language-server
require'lspconfig'.vimls.setup{capabilities = capabilities}

-- require other files lsp config folder
require('lsps/lua-sumneko')

-- LSP config mappings{{{
vim.g.mapleader = ','
local key_opts = {silent=true, noremap=true}
vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', key_opts)
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', key_opts)
vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', key_opts)
vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', key_opts)
vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', key_opts)
vim.api.nvim_set_keymap('n', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', key_opts)
-- vim.api.nvim_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', key_opts)
vim.api.nvim_set_keymap('n', '<leader>rn', ':Lspsaga rename<CR>', key_opts)
vim.api.nvim_set_keymap('n', 'ca', ':Lspsaga code_action<CR>', key_opts)
vim.api.nvim_set_keymap('n', 'cd', ':Lspsaga show_line_diagnostics<CR>', key_opts)
-- vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', key_opts)
vim.api.nvim_set_keymap('n', 'K', ':Lspsaga hover_doc<CR>', key_opts)
vim.api.nvim_set_keymap('n', '<C-p>', ':Lspsaga diagnostic_jump_prev<CR>', key_opts)
vim.api.nvim_set_keymap('n', '<C-n>', ':Lspsaga diagnostic_jump_next<CR>', key_opts)
-- }}}
