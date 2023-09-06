--
-- === COLOR & PLUGIN SETTINGS ===
--
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
