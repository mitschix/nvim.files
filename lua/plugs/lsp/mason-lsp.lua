return {
    { "williamboman/mason.nvim", lazy=true, cmd = {'Mason'},
    config = function ()
        require("mason").setup{
            ui = { icons = { package_installed = "✓", package_pending = "➜", package_uninstalled = "✗" } }
        }

        -- LSP diagnostics color config {{{
        -- TODO highlight currently not in vim.api
        vim.cmd([[
        hi DiagnosticDefaultError ctermfg=red guifg=#D54E53
        hi DiagnosticVirtualTextError ctermfg=red  guifg=#D54E53

        hi DiagnosticDefaultWarn ctermfg=yellow guifg=#E7C547
        hi DiagnosticVirtualTextWarn ctermfg=yellow guifg=#E7C547

        hi DiagnosticDefaultInfo ctermfg=white guifg=#EAEAEA
        hi DiagnosticVirtualTextInfo ctermfg=white guifg=#EAEAEA

        hi DiagnosticDefaultHint ctermfg=blue guifg=#7AA6DA
        hi DiagnosticVirtualTextHint ctermfg=blue guifg=#7AA6DA
        ]])
        -- }}}

        -- remove diagnostic signs and only color numbers
        vim.fn.sign_define("DiagnosticSignError", {text = "", numhl = "DiagnosticDefaultError"})
        vim.fn.sign_define("DiagnosticSignWarn", {text = "", numhl = "DiagnosticDefaultWarn"})
        vim.fn.sign_define("DiagnosticSignInfo", {text = "", numhl = "DiagnosticDefaultInfo"})
        vim.fn.sign_define("DiagnosticSignHint", {text = "", numhl = "DiagnosticDefaultHint"})
    end
    },

    {"ray-x/lsp_signature.nvim", lazy = true}, -- has no trigger -> triggerd on lsp attach
    {'tami5/lspsaga.nvim', cmd = {'Lspsaga'}, lazy=true},
}
