-- remove diagnostic signs and only color numbers
vim.fn.sign_define("LspDiagnosticsSignError", {text = "", numhl = "LspDiagnosticsDefaultError"})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "", numhl = "LspDiagnosticsDefaultWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "", numhl = "LspDiagnosticsDefaultInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = "", numhl = "LspDiagnosticsDefaultHint"})


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
