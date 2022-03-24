--
-- === COLOR & PLUGIN SETTINGS ===
--
--
-- set sonokai if installed silent to suppress errors if not
vim.g.sonokai_transparent_background = 1
vim.cmd('silent! colorscheme sonokai')
-- " add visible column
vim.opt.termguicolors = true
vim.opt.colorcolumn='81'

-- Highlight extra whitespaces
vim.cmd('highlight ExtraWhitespace ctermbg=darkblue guibg=#81A2BE')
-- nnoremap <F9> :set termguicolors!<CR>

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
