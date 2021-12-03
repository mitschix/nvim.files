-- remove diagnostic signs and only color numbers
vim.fn.sign_define("DiagnosticSignError", {text = "", numhl = "DiagnosticDefaultError"})
vim.fn.sign_define("DiagnosticSignWarn", {text = "", numhl = "DiagnosticDefaultWarn"})
vim.fn.sign_define("DiagnosticSignInfo", {text = "", numhl = "DiagnosticDefaultInfo"})
vim.fn.sign_define("DiagnosticSignHint", {text = "", numhl = "DiagnosticDefaultHint"})


require'lsp_signature'.setup()

require'lspconfig'.pylsp.setup{
    settings = {
        pyls = {
            plugins = {
                pylint = {enabled = true; }
            }
        }
    }
}


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
}

require'lspconfig'.vimls.setup{}

-- require other files lsp config folder
require('lsps/lua-sumneko')
